import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/my_text.dart';
import '../controllers/bottom_profile_controller.dart';

class BottomProfileView extends GetView<BottomProfileController> {
  bool state = false;
  bool isSwitched = false;
  var textValue = 'Switch is OFF';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: height * 0.02),
          Container(
            height: height / 14,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width / 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/icons/smallLogo.png',
                  height: height * 0.060,
                ),
                GestureDetector(
                    onTap: () => Get.toNamed(Routes.NOTIFICATIONS),
                    child: SvgPicture.asset('assets/icons/notification.svg')),
              ],
            ),
          ),
          SizedBox(height: height * 0.034),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 20),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  width: width,
                  decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/icons/avatar.png'),
                      ),
                      SizedBox(height: height * 0.016),
                      MyText(
                        text: 'Raju Mullah',
                        size: 20 * sp,
                        weight: ksix,
                        color: kblack,
                      ),
                      SizedBox(height: height * 0.014),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Account type :',
                              style: TextStyle(
                                color: kblack,
                                fontWeight: kfour,
                                fontSize: 14 * sp,
                                fontFamily: 'WorkSans',
                              ),
                            ),
                            TextSpan(
                              text: ' Business',
                              style: TextStyle(
                                fontFamily: 'WorkSans',
                                color: kblack,
                                fontWeight: ksix,
                                fontSize: 14 * sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.03, horizontal: width / 25),
                  width: width,
                  decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      MyText(
                        text: 'Total points',
                        size: 14 * sp,
                        weight: kfour,
                        color: kgrey8,
                      ),
                      SizedBox(height: height * 0.009),
                      MyText(
                        text: '500',
                        size: 32 * sp,
                        weight: kseven,
                        color: kprimaryColor,
                      ),
                      SizedBox(height: height * 0.014),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: MyText(
                              text: 'Get 1 more mystery box',
                              size: 14 * sp,
                              weight: kseven,
                              color: kprimaryColor,
                            ),
                          ),
                          FittedBox(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: r'1550$',
                                    style: TextStyle(
                                      color: kprimaryColor,
                                      fontWeight: ksix,
                                      fontSize: 16 * sp,
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                  TextSpan(
                                    text: r'/250$',
                                    style: TextStyle(
                                      fontFamily: 'WorkSans',
                                      color: kgrey8,
                                      fontWeight: kfour,
                                      fontSize: 14 * sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.009),
                      LinearProgressIndicator(
                        minHeight: height * 0.009,
                        backgroundColor: kgrey2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          kprimaryColor,
                        ),
                        value: 0.6,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                GestureDetector(
                    onTap: () => Get.toNamed(Routes.ACCOUNT_SETTING),
                    child: buildAccountSetting(height, width, sp)),
                SizedBox(height: height * 0.015),
                GestureDetector(
                    onTap: () => Get.toNamed(Routes.PAYMENT_AND_DEPOSIT),
                    child: buildPaymentAdDeposit(height, width, sp)),
                SizedBox(height: height * 0.015),
                buildNotification(height, width, sp),
                SizedBox(height: height * 0.05),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Container buildNotification(double height, double width, double sp) {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.024,
          horizontal: width / 25,
        ),
        width: width,
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/notification.svg',
                    color: kgre7,
                  ),
                  SizedBox(width: width * 0.02),
                  MyText(
                    text: 'Notification setting',
                    size: 14 * sp,
                    weight: kfour,
                    color: Color(0xff090A0A),
                  )
                ],
              ),
            ),
            FittedBox(
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.20,
                    child: CupertinoSwitch(
                  value: state,
                  onChanged: (value) {
                    state = value;
                    setState(
                      () {},
                    );
                  },
                  thumbColor: kwhite,
                  activeColor: kprimaryColor,
                ));
              }),
            )
          ],
        ));
  }

  Container buildPaymentAdDeposit(double height, double width, double sp) {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.024,
          horizontal: width / 25,
        ),
        width: width,
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/card.svg'),
                  SizedBox(width: width * 0.02),
                  Expanded(
                    child: MyText(
                      text: 'Payment & Deposte methods',
                      size: 14 * sp,
                      weight: kfour,
                      color: Color(0xff090A0A),
                    ),
                  )
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color(0xff090A0A),
              size: 16,
            )
          ],
        ));
  }

  Container buildAccountSetting(double height, double width, double sp) {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.024,
          horizontal: width / 25,
        ),
        width: width,
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/accountSetting.svg',
                    height: height * 0.03,
                  ),
                  SizedBox(width: width * 0.02),
                  MyText(
                    text: 'Account settings',
                    size: 14 * sp,
                    weight: kfour,
                    color: Color(0xff090A0A),
                  )
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color(0xff090A0A),
              size: 16,
            )
          ],
        ));
  }
}
