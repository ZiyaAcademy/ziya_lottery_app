// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AdBanner extends StatelessWidget {
//   final List<String> imageUrls;

//   const AdBanner({super.key, required this.imageUrls});

//   @override
//   Widget build(BuildContext context) {
//     if (imageUrls.isEmpty) {
//       return const SizedBox.shrink();
//     }

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w),
//       child: CarouselSlider.builder(
//         itemCount: imageUrls.length,
//         itemBuilder: (context, index, realIndex) {
//           return Container(
//             width: double.infinity,
//             margin: EdgeInsets.symmetric(horizontal: 5.w),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15.r),
//               image: DecorationImage(
//                 image: NetworkImage(imageUrls[index]),
//                 fit: BoxFit.cover,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.08),
//                   blurRadius: 8,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//           );
//         },
//         options: CarouselOptions(
//           height: 150.h,
//           autoPlay: true,
//           autoPlayInterval: const Duration(seconds: 4),
//           viewportFraction: 0.99,
//           enlargeCenterPage: true,
//           enableInfiniteScroll: true,
//           scrollDirection: Axis.horizontal,
//           autoPlayCurve: Curves.fastOutSlowIn,
//         ),
//       ),
//     );
//   }
// }
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AdBanner extends StatefulWidget {
//   final List<String> imageUrls;

//   const AdBanner({super.key, required this.imageUrls});

//   @override
//   State<AdBanner> createState() => _AdBannerState();
// }

// class _AdBannerState extends State<AdBanner> {
//   late List<String> validImages;

//   @override
//   void initState() {
//     super.initState();
//     validImages = List.from(widget.imageUrls);
//   }

//   void _onImageError(String url) {
//     if (!mounted || !validImages.contains(url)) return;

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (mounted && validImages.contains(url)) {
//         setState(() {
//           validImages.remove(url);
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (validImages.isEmpty) {
//       return const SizedBox.shrink();
//     }

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h), // ✅ Small padding
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16.r), // ✅ Smooth corners
//         child: CarouselSlider.builder(
//           itemCount: validImages.length,
//           itemBuilder: (context, index, realIndex) {
//             final imageUrl = validImages[index];
//             return Image.network(
//               imageUrl,
//               width: double.infinity,
//               fit: BoxFit.cover,
//               loadingBuilder: (context, child, loadingProgress) {
//                 if (loadingProgress == null) return child;
//                 return const Center(child: CircularProgressIndicator());
//               },
//               errorBuilder: (context, error, stackTrace) {
//                 _onImageError(imageUrl);
//                 return const SizedBox.shrink();
//               },
//             );
//           },
//           options: CarouselOptions(
//             height: 150.h,
//             autoPlay: true,
//             autoPlayInterval: const Duration(seconds: 4),
//             viewportFraction: 1.0, // ✅ full width inside padding
//             enlargeCenterPage: false,
//             enableInfiniteScroll: true,
//             scrollDirection: Axis.horizontal,
//             autoPlayCurve: Curves.fastOutSlowIn,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdBanner extends StatefulWidget {
  final List<String> imageUrls;

  const AdBanner({super.key, required this.imageUrls});

  @override
  State<AdBanner> createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {
  late List<String> validImages;

  @override
  void initState() {
    super.initState();
    validImages = List.from(widget.imageUrls);
  }

  void _onImageError(String failedUrl) {
    // ✅ remove failed image safely
    if (mounted && validImages.contains(failedUrl)) {
      setState(() {
        validImages.remove(failedUrl);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (validImages.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: CarouselSlider.builder(
        itemCount: validImages.length,
        itemBuilder: (context, index, realIndex) {
          final imageUrl = validImages[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: Colors.grey[200],
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                // ✅ remove only the failed image
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _onImageError(imageUrl);
                });
                return const SizedBox.shrink();
              },
            ),
          );
        },
        options: CarouselOptions(
          height: 150.h,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          viewportFraction: 0.99,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }
}
