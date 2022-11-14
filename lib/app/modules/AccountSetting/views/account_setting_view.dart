import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/account_setting_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/borders.dart';
import 'package:video_editing_app/widgets/login_field.dart';
import 'package:video_editing_app/widgets/my_text.dart';

import '../../../../constants/colors.dart';
import '../../../../widgets/box_shadow.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../routes/app_pages.dart';

class AccountSettingView extends GetView<AccountSettingController> {
  final List<String> genderItems = [
    'Business',
    'Videographer',
    'Agency',
    'Content Creator',
    'Others'
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    print("width " + width.toString());
    print("height " + height.toString());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF9F9FB),
        appBar: AppBar(
          backgroundColor: Color(0xffF9F9FB),
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: kblack,
              size: 16,
            ),
          ),
          title: MyText(
            text: 'Settings',
            size: 16 * sp,
            weight: ksix,
            color: kblack,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle(sp, title: 'User name'),
                      SizedBox(height: height * 0.008),
                      buildLoginFields(
                        sp,
                        hinttext: 'Enter your User name',
                        controller: controller.userNameController,
                        validator: null,
                      ),
                      SizedBox(height: height * 0.030),
                      buildTitle(sp, title: 'Account type'),
                      SizedBox(height: height * 0.008),
                      DropdownButtonFormField2(
                        searchController: controller.accountTypeController,
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
                          text: 'Business',
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
                        items: genderItems
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
                            return 'Please select gender.';
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
                      buildTitle(sp, title: 'Phone number'),
                      SizedBox(height: height * 0.008),
                      buildLoginFields(
                        sp,
                        hinttext: 'phone number',
                        controller: controller.phoneNumberController,
                        validator: null,
                      ),
                      SizedBox(height: height * 0.030),
                      buildTitle(sp, title: 'New password'),
                      SizedBox(height: height * 0.008),
                      buildLoginFields(
                        sp,
                        hinttext: '*********',
                        controller: controller.newPasswordController,
                        validator: null,
                      ),
                      SizedBox(height: height * 0.030),
                      buildTitle(sp, title: 'Confirm Password'),
                      SizedBox(height: height * 0.008),
                      buildLoginFields(
                        sp,
                        hinttext: '*********',
                        controller: controller.confirmController,
                        validator: null,
                      ),
                      SizedBox(height: height / 17),
                      Container(
                        height: height / 14,
                        width: Get.width,
                        decoration: BoxDecoration(boxShadow: [kshadow]),
                        child: MyButton(
                          text: 'Save changes',
                          size: 14 * sp,
                          weight: kfive,
                          onPress: () {
                            Get.back();
                          },
                        ),
                      ),
                      SizedBox(height: height / 28),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
