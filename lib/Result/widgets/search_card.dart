import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/Constants/app_strings.dart';
import 'package:ziya_lottery_app/Result/ViewModel/lottery_view_model.dart';

class SearchCard extends StatefulWidget {
  const SearchCard({super.key});

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  final TextEditingController _searchController = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _dropdownOverlay;

  List<String> _filteredLotteries = [];
  final List<String> _lotteryNames = AppStrings.lotteryNames;

  @override
  void initState() {
    super.initState();
    _filteredLotteries = _lotteryNames;
  }

  @override
  void dispose() {
    _removeDropdown();
    _searchController.dispose();
    super.dispose();
  }

  void _filterLotteries(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredLotteries = _lotteryNames;
      } else {
        _filteredLotteries = _lotteryNames
            .where(
              (lottery) => lottery.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  void _showDropdown(LotteryViewModel provider) {
    _removeDropdown();
    final overlay = Overlay.of(context);
    if (overlay == null) return;

    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _dropdownOverlay = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx + 20.w,
        top: position.dy + 42.h,
        width: renderBox.size.width - 40.w,
        child: _buildDropdownOverlay(provider),
      ),
    );

    overlay.insert(_dropdownOverlay!);
  }

  void _removeDropdown() {
    _dropdownOverlay?.remove();
    _dropdownOverlay = null;
  }

  void _showSmoothSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: AppColors.primaryBlueDark.withOpacity(0.95),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        duration: const Duration(seconds: 2),
        elevation: 4,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LotteryViewModel>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          CompositedTransformTarget(
            link: _layerLink,
            child: _buildSearchField(context, provider),
          ),
          SizedBox(height: 12.h),
          _buildDateField(context, provider),
          SizedBox(height: 18.h),
          _buildCheckButton(provider),
        ],
      ),
    );
  }

  Widget _buildDropdownOverlay(LotteryViewModel provider) {
    final int itemCount = _filteredLotteries.length;

    // Each item takes ~48.h height → dropdown height = itemCount * 48.h
    final double dropdownHeight = itemCount * 48.h;

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(12.r),
      color: Colors.white,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: dropdownHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListView.builder(
          physics:
              const NeverScrollableScrollPhysics(), // disable scroll — full expand
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                _searchController.text = _filteredLotteries[index];
                provider.updateSearchNumber(_filteredLotteries[index]);
                _removeDropdown();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.borderGrey, width: 1),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.confirmation_number_outlined,
                      color: AppColors.primaryBlueDark,
                      size: 20.w,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        _filteredLotteries[index],
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.textBlack,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context, LotteryViewModel provider) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        height: 37.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                ),
              ),
              alignment: Alignment.center,
              child: Icon(Icons.search, color: Colors.white, size: 22.w),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  _filterLotteries(value);
                  provider.updateSearchNumber(value);
                  if (value.isNotEmpty) {
                    _showDropdown(provider);
                  } else {
                    _removeDropdown();
                  }
                },
                onTap: () {
                  if (_filteredLotteries.isNotEmpty) _showDropdown(provider);
                },
                style: TextStyle(fontSize: 14.sp, color: AppColors.textBlack),
                decoration: InputDecoration(
                  hintText: AppStrings.enterLotteryHint,
                  hintStyle: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textHint,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_dropdownOverlay == null) {
                  _showDropdown(provider);
                } else {
                  _removeDropdown();
                }
                FocusScope.of(context).unfocus();
              },
              child: Container(
                width: 48.w,
                alignment: Alignment.center,
                child: Icon(
                  _dropdownOverlay == null
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                  color: AppColors.textHint,
                  size: 24.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context, LotteryViewModel provider) {
    final String dateDisplay = provider.selectedDate == null
        ? AppStrings.selectDate
        : DateFormat('dd/MM/yyyy').format(provider.selectedDate!);

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10.r),
      child: GestureDetector(
        onTap: () async {
          _removeDropdown();
          DateTime now = DateTime.now();
          DateTime? picked = await showDatePicker(
            context: context,
            initialDate: provider.selectedDate ?? now,
            firstDate: DateTime(2000),
            lastDate: DateTime(now.year, now.month, now.day),
            builder: (context, child) => Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColors.primaryBlueDark,
                  onPrimary: Colors.white,
                  onSurface: AppColors.textBlack,
                ),
              ),
              child: child!,
            ),
          );
          if (picked != null) provider.updateSearchDate(picked);
        },
        child: Container(
          height: 37.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Container(
                width: 48.w,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                  ),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white,
                  size: 20.w,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  dateDisplay,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: provider.selectedDate == null
                        ? AppColors.textHint
                        : AppColors.textBlack,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckButton(LotteryViewModel provider) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(10.r),
      child: SizedBox(
        width: double.infinity,
        height: 40.h,
        child: ElevatedButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            _removeDropdown();
            if (_searchController.text.isEmpty ||
                provider.selectedDate == null) {
              _showSmoothSnackBar(context, AppStrings.errorSelectBoth);
            } else {
              provider.showResults();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: Text(
            AppStrings.checkButton,
            style: TextStyle(
              color: AppColors.primaryBlueDark,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}
