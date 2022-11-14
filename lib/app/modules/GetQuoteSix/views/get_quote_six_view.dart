import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/widgets/mediaquery.dart';

import '../controllers/get_quote_six_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/widgets/box_shadow.dart';
import 'package:video_editing_app/widgets/elevated_button_widget.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/borders.dart';
import '../../../../widgets/login_field.dart';
import '../../../../widgets/my_text.dart';

class GetQuoteSixView extends GetView<GetQuoteSixController> {
  final List<String> minutes = [
    '1-30 minutes',
    '20-30 minutes',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.040),
                MyText(
                  text: "Video #1",
                  size: 16 * sp,
                  color: kblack,
                  weight: ksix,
                ),
                SizedBox(height: height * 0.040),
                buildTitle(sp, title: 'Number of minutes estimated'),
                SizedBox(height: height * 0.008),
                DropdownButtonFormField2(
                  searchController: controller.dropDownController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kwhite,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: enabledborder,
                    enabledBorder: enabledborder,
                    focusedBorder: focusedborder,
                  ),
                  isExpanded: true,
                  hint: MyText(
                    text: '1-30 minutes',
                    size: 12 * sp,
                    weight: kfour,
                    color: kgrey8,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Color(0xffD3D5DA),
                  ),
                  iconSize: 30,
                  buttonHeight: height / 14,
                  buttonPadding: EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  items: minutes
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return '1-30 minutes.';
                    }
                  },
                  onChanged: (value) {
                    //Do something when changing the item if you want.
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                ),
                SizedBox(height: height * 0.030),
                buildTitle(sp, title: 'Google drive url * ( Raw video)'),
                SizedBox(height: height * 0.008),
                buildLoginFields(
                  sp,
                  hinttext: 'Enter URL',
                  controller: controller.urlController,
                  validator: null,
                ),
                SizedBox(height: height * 0.030),
                buildTitle(
                  sp,
                  title:
                      'Please decribe any animated texr or special\neffects you may want)',
                ),
                SizedBox(height: height * 0.008),
                Container(
                  height: height * 0.2,
                  decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: kgrey3,
                    ),
                  ),
                  child: TextField(
                    controller: controller.descripController,
                    style: TextStyle(
                      fontSize: 14 * sp,
                      fontWeight: kfour,
                      color: Color(0xff25313A),
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: width * 0.02),
                      hintText: 'write something here',
                      hintStyle: TextStyle(
                        fontSize: 14 * sp,
                        fontWeight: kfour,
                        color: kgrey3,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: height / 7),
                Container(
                  decoration: BoxDecoration(boxShadow: [kshadow]),
                  width: width,
                  height: height * 0.07,
                  child: MyButton(
                    text: 'Next',
                    onPress: () {
                      Get.toNamed(Routes.GET_QUOTE_SEVEN);
                    },
                  ),
                ),
                SizedBox(height: height * 0.05)
              ],
            ),
          ),
        ),
      ),
    );
  }

  MyText buildTitle(double sp, {required String title}) {
    return MyText(
      text: "$title",
      size: 14 * sp,
      weight: kfour,
      color: Color(0xff25313A),
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
