import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/constants/colors.dart';

import '../../../../constants/weight.dart';
import '../../../../widgets/my_text.dart';
import '../controllers/send_message_controller.dart';

class SendMessageView extends GetView<SendMessageController> {
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
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 15,
              color: kblack,
            ),
          ),
          title: Container(
            height: height * 0.07,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage('assets/icons/circleAppbar.png'),
                      ),
                      SizedBox(
                        width: width / 35,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: "Jerry Helfer",
                            size: 14 * sp,
                            weight: ksix,
                            color: kgrey8,
                          ),
                          SizedBox(
                            height: height * 0.009,
                          ),
                          MyText(
                            text: "Online",
                            size: 10 * sp,
                            weight: kfour,
                            color: kcomplete,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Icon(
              Icons.more_vert,
              color: kblack,
              size: 24,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  child: Column(
                    children: [
                      MyText(
                        text: '09:41 AM',
                        size: 14 * sp,
                        weight: kfour,
                        color: Color(0xff979C9E),
                      ),
                      SizedBox(height: height * 0.01),
                      ReceiveMsg(height, width, sp, receiveText: 'Hi, Mandy'),
                      SizedBox(height: height * 0.019),
                      ReceiveMsg(
                        height,
                        width,
                        sp,
                        receiveText: 'I’ve tried the app',
                      ),
                      SizedBox(height: height * 0.019),
                      SendMsg(height, width, sp),
                      SizedBox(height: height * 0.019),
                      ReceiveMsg(
                        height,
                        width,
                        sp,
                        receiveText: 'Yeah, It’s really good!',
                      ),
                      SizedBox(height: height * 0.019),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage:
                                AssetImage('assets/icons/circleAppbar.png'),
                          ),
                          SizedBox(width: width * 0.02),
                          MyText(
                            text: 'Typing...',
                            size: 14 * sp,
                            weight: kfour,
                            color: Color(0xff979C9E),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.024),
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.0095, horizontal: width / 20),
                height: height * 0.098,
                width: width,
                color: kwhite,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.78,
                      child: TextFormField(
                        controller: controller.msgController,
                        style: TextStyle(
                          fontSize: 14 * sp,
                          fontWeight: kfour,
                          fontFamily: 'Poppins',
                          color: kblack,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintStyle: TextStyle(
                            fontSize: 14 * sp,
                            fontWeight: kfour,
                            fontFamily: 'Poppins',
                            color: Color(0xff9EA3AE),
                          ),
                          hintText: 'Type your message',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: BorderSide(color: kgrey3, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: BorderSide(color: kgrey3, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: BorderSide(color: kgrey3, width: 1.0),
                          ),
                          suffixIcon: FittedBox(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/upload.svg',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              'assets/icons/smile.svg',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.022),
                    SvgPicture.asset('assets/icons/frwrd.svg')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ReceiveMsg(double height, double width, double sp,
      {required String receiveText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: height * 0.067,
          padding: EdgeInsets.symmetric(horizontal: width / 25),
          decoration: BoxDecoration(
            color: kprimaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: MyText(
              text: '$receiveText',
              size: 14 * sp,
              weight: kfour,
              color: kwhite,
            ),
          ),
        ),
        SizedBox(
          width: width * 0.02,
        ),
        CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage('assets/icons/chatPerson.png'),
        )
      ],
    );
  }

  SendMsg(double height, double width, double sp) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage('assets/icons/circleAppbar.png'),
        ),
        SizedBox(
          width: width * 0.02,
        ),
        Container(
          height: height * 0.067,
          padding: EdgeInsets.symmetric(horizontal: width / 25),
          decoration: BoxDecoration(
            color: Color(0xffF2F4F5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: MyText(
              text: 'Really?',
              size: 14 * sp,
              weight: kfour,
              color: kblack,
            ),
          ),
        ),
      ],
    );
  }
}
