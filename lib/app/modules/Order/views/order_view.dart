import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import '../controllers/order_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import '../../../../widgets/my_text.dart';

OrderController controller = Get.put(OrderController());
List<String> _status = ['All', 'Assigned', 'In progress', 'Completed'];

class OrderView extends GetView {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    var fourStyle = TextStyle(
      color: kgre7,
      fontSize: 14 * sp,
      fontWeight: kfour,
      fontFamily: 'WorkSans',
    );
    var sixStyle = TextStyle(
      color: kgre7,
      fontSize: 14 * sp,
      fontWeight: ksix,
      fontFamily: 'WorkSans',
    );

    return Scaffold(
      backgroundColor: Color(0xffF9F9FB),
      body: SingleChildScrollView(
        child: Column(
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
                        onTap: () {
                          Get.toNamed(Routes.REWARDS);
                        },
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
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.034),
            GetBuilder<OrderController>(
              init: OrderController(),
              // You can initialize your controller here the first time. Don't use init in your other GetBuilders of same controller
              builder: (_) => Padding(
                padding: EdgeInsets.only(left: width * 0.055),
                child: SizedBox(
                  height: height * 0.05,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        _status.length,
                        (index) => GestureDetector(
                          onTap: () {
                            controller.changeColor(index);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: width * 0.01),
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            height: height * 0.05,
                            decoration: BoxDecoration(
                              color: controller.selctedIndex == index
                                  ? kprimaryColor
                                  : Color(0xffF9F9FB),
                              border: Border.all(
                                color: controller.selctedIndex == index
                                    ? kprimaryColor
                                    : kgrey2,
                              ),
                              borderRadius: BorderRadius.circular(38),
                            ),
                            child: Center(
                              child: MyText(
                                text: '${_status[index]}',
                                size: 12 * sp,
                                weight: kfour,
                                color: controller.selctedIndex == index
                                    ? kwhite
                                    : kgrey8,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: height * 0.024),

            ///QUOTE CONTAINER
            GestureDetector(
              onTap: () => Get.toNamed(Routes.PROJECT_DETAILS),
              child: buildProjectTitle(
                width,
                height,
                sp,
                richText: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '20 Sept 2022, 06:23 PM',
                        style: TextStyle(
                          color: kgre7,
                          fontSize: 14 * sp,
                          fontWeight: kfour,
                          fontFamily: 'WorkSans',
                        ),
                      ),
                    ],
                  ),
                ),
                containerText: 'Quote',
                containerColor: kwarning.withOpacity(0.10),
                containerTextColor: kwarning,
              ),
            ),

            ///INPROGRESS CONTAINER
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.IN_PROGRESS);
              },
              child: buildProjectTitle(
                width,
                height,
                sp,
                richText: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Project Timeline :   ', style: fourStyle),
                      TextSpan(text: '10:44:20', style: sixStyle),
                    ],
                  ),
                ),
                containerText: 'In Progress',
                containerColor: kinfo.withOpacity(0.10),
                containerTextColor: kinfo,
              ),
            ),
            ...List.generate(
              4,
              (index) => GestureDetector(
                onTap: () => Get.toNamed(Routes.COMPLETED),
                child: buildProjectTitle(
                  width,
                  height,
                  sp,
                  richText: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: '20 Sept 2022, 06:23 PM', style: fourStyle),
                      ],
                    ),
                  ),
                  containerText: 'Completed',
                  containerColor: kcomplete.withOpacity(0.10),
                  containerTextColor: kcomplete,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildProjectTitle(double width, double height, double sp,
      {required var richText,
      required Color containerColor,
      required String containerText,
      required Color containerTextColor}) {
    return Container(
      margin: EdgeInsets.only(
        bottom: height * 0.015,
        left: width * 0.053,
        right: width * 0.053,
      ),
      padding: EdgeInsets.only(
          top: height * 0.02, left: width * 0.04, right: width * 0.04),
      height: height * 0.12,
      width: width,
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Project title",
                  size: 16 * sp,
                  weight: ksix,
                  color: kblack,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                richText,
              ],
            ),
          ),
          FittedBox(
            child: Container(
              height: height * 0.04,
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(38),
              ),
              child: Center(
                child: MyText(
                  text: '$containerText',
                  size: 10 * sp,
                  weight: kfour,
                  color: containerTextColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
