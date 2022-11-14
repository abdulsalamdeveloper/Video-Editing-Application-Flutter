import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/my_text.dart';

import '../../../../widgets/box_shadow.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../controllers/sign_selectection_controller.dart';

class SignSelectectionView extends GetView<SignSelectectionController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 20),
          child: Column(
            children: [
              SizedBox(
                height: height / 3,
              ),
              MyText(
                height: 1.5,
                align: TextAlign.center,
                text: "Connecting the right editors to\nthe right clients",
                size: 20 * sp,
                weight: kseven,
                color: kgrey6,
              ),
              SizedBox(height: height * 0.07),
              Container(
                height: height / 14,
                width: width,
                decoration: BoxDecoration(boxShadow: [kshadow]),
                child: MyButton(
                  text: 'Sign up as buyer',
                  size: 14 * sp,
                  weight: kfive,
                  onPress: () {
                    Get.toNamed(Routes.SIGN_IN);
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              SizedBox(
                height: height / 14,
                width: width,
                child: MyButton(
                  text: 'Sign up as editor',
                  size: 14 * sp,
                  weight: kfive,
                  color: kwhite,
                  textColor: kprimaryColor,
                  onPress: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
