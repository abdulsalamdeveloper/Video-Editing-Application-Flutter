import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/borders.dart';
import '../../../../widgets/box_shadow.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../../widgets/login_field.dart';
import '../../../../widgets/my_text.dart';
import '../../../routes/app_pages.dart';
import '../controllers/get_quote_four_controller.dart';

class GetQuoteFourView extends GetView<GetQuoteFourController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xffF9F9FB),
            leading: Padding(
              padding: EdgeInsets.all(5),
              child: backButton(),
            ),
            title: MyText(
              text: "Get Quote",
              size: 16 * sp,
              color: kblack,
              weight: ksix,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.049),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.040),
                buildTitle(sp, title: 'Project tittle'),
                SizedBox(height: height * 0.008),
                buildLoginFields(
                  sp,
                  hinttext: 'Project tittle',
                  controller: controller,
                  validator: null,
                ),
                SizedBox(height: height * 0.030),
                buildTitle(sp, title: 'How many videos will you need?'),
                SizedBox(height: height * 0.008),
                buildLoginFields(
                  sp,
                  hinttext: '2',
                  controller: controller,
                  validator: null,
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(boxShadow: [kshadow]),
                  width: width,
                  height: height * 0.07,
                  child: MyButton(
                    text: 'Next',
                    onPress: () {
                      Get.toNamed(Routes.GET_QUOTE_FIVE);
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                )
              ],
            ),
          )),
    );
  }

  MyText buildTitle(double sp, {required String title}) {
    return MyText(
      text: "$title",
      size: 12 * sp,
      weight: kfour,
      color: kgrey8,
    );
  }

  LoginFields buildLoginFields(double sp,
      {required String hinttext,
      required var controller,
      required var validator}) {
    return LoginFields(
      contentPadding: EdgeInsets.fromLTRB(12, 16, 12, 16),
      fieldValidator: validator,
      style: TextStyle(
        fontSize: 12 * sp,
        fontWeight: kfour,
        color: kblack,
      ),
      hintText: '$hinttext',
      hintStyle: TextStyle(
        fontSize: 12 * sp,
        fontWeight: kfour,
        color: kgrey3,
      ),
      enableBorder: enabledborder,
      errorBorder: errorborder,
      focusBorder: focusedborder,
    );
  }
}
