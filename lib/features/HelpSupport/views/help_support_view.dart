import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/features/HelpSupport/models/faq_model.dart';
import 'package:ziya_lottery_app/features/HelpSupport/view_models/help_support_vm.dart';

class HelpSupportView extends StatelessWidget {
  const HelpSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HelpSupportViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Text("Help & Support"),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Consumer<HelpSupportViewModel>(
          builder: (context, vm, _) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...vm.sections.entries.map(
                    (entry) => Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entry.key,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          _buildFAQList(context, vm, entry.key, entry.value),
                        ],
                      ),
                    ),
                  ),
                  _buildContactCard(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFAQList(
    BuildContext context,
    HelpSupportViewModel vm,
    String sectionTitle,
    List<FAQModel> faqs,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: faqs.asMap().entries.map((entry) {
          final index = entry.key;
          final faq = entry.value;
          return ExpansionTile(
            key: Key(faq.title),
            initiallyExpanded: faq.isExpanded,
            tilePadding: EdgeInsets.symmetric(horizontal: 15.w),
            childrenPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 5.h,
            ),
            title: Text(
              faq.title,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            iconColor: Colors.black,
            collapsedIconColor: Colors.grey,
            onExpansionChanged: (_) => vm.toggleExpansion(sectionTitle, index),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  faq.content,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContactCard() {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.phone, color: AppColors.black, size: 20.sp),
            SizedBox(width: 10.w),
            Text(
              "Contact Support",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(15.w),
          margin: EdgeInsets.only(top: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              const Text(
                "Support Email",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const Text("support@sliamart.com"),
              SizedBox(height: 12.h),
              const Text(
                "Support Hours",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const Text(
                "9:00 AM – 6:00 PM (Monday to Saturday)\nClosed on Sundays & Public Holidays",
              ),
              SizedBox(height: 15.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonClr,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: const Text(
                    "Raise a Ticket",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
