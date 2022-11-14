import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/box_shadow.dart';

import '../../../../widgets/my_text.dart';
import '../controllers/home_controller.dart';

List<String> categories = [
  'Reel/Youtube/Tiktok ',
  'Social Media Ad',
  'Wedding',
  'Music',
  'Real Estate'
];

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF9F9FB),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.02),
            Container(
              height: height / 14,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.053),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icons/smallLogo.png',
                    height: height * 0.060,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.REWARDS),
                        child: Container(
                          margin: EdgeInsets.only(right: width * 0.016),
                          height: width * 0.060,
                          width: 117,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(53),
                            color: kprimaryColor,
                          ),
                          child: Center(
                            child: MyText(
                              text: 'Tap to see points',
                              size: 10 * sp,
                              weight: kfour,
                              color: kwhite,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.NOTIFICATIONS),
                        child:
                            SvgPicture.asset('assets/icons/notification.svg'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.034),

            GestureDetector(
              onTap: () => Get.toNamed(Routes.GET_QUOTE),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.043),
                width: width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 10,
                      spreadRadius: 0.0,
                      color: kprimaryColor.withOpacity(0.25),
                    )
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/icons/getCustom.svg',
                  width: width,
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: width * 0.043),
            //   height: height * 0.070,
            //   width: width,
            //   decoration: BoxDecoration(
            //     boxShadow: [kshadow],
            //     color: kprimaryColor,
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: GestureDetector(
            //     onTap: () => Get.toNamed(Routes.GET_QUOTE),
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: kprimaryColor,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: FittedBox(
            //         child:
            //             SvgPicture.asset('assets/icons/getCustom.svg'),
            //       // ),SizedBox(width: ,)
            //       // Expanded(
            //       //   child: MyText(
            //       //     text: "Get a Custom Quote",
            //       //     size: 16 * sp,
            //       //     weight: kseven,
            //       //     color: kwhite,
            //       //   ),
            //       // )
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.053),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Categories",
                    size: 16 * sp,
                    weight: ksix,
                    color: kgrey8,
                  ),
                  SizedBox(height: height * 0.016),
                  ...List.generate(
                      categories.length,
                      (index) => Container(
                            margin: EdgeInsets.only(bottom: height * 0.022),
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            height: height * 0.07,
                            width: width,
                            decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: "${categories[index]}",
                                  size: 14 * sp,
                                  color: kgrey8,
                                  weight: ksix,
                                ),
                                SvgPicture.asset(
                                    'assets/icons/forwardPrimary.svg'),
                              ],
                            ),
                          ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
