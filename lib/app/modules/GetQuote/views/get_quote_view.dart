import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/widgets/back_button.dart';
import 'package:video_editing_app/widgets/box_shadow.dart';
import 'package:video_editing_app/widgets/elevated_button_widget.dart';
import 'package:video_editing_app/widgets/my_text.dart';

import '../../../../constants/weight.dart';
import '../controllers/get_quote_controller.dart';

class GetQuoteView extends GetView<GetQuoteController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    print('height' + (height * 0.12).toString());
    var stylegrey = TextStyle(
      fontSize: 14 * sp,
      fontWeight: kfour,
      color: kgrey5,
    );
    var styleprimary = TextStyle(
      fontSize: 14 * sp,
      fontWeight: ksix,
      color: kprimaryColor,
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF9F9FB),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffF9F9FB),
          leading: Padding(
            padding: EdgeInsets.all(5.0),
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
              SizedBox(height: height * 0.028),
              MyText(
                text: "Please choose package",
                size: 16 * sp,
                color: kgrey8,
                weight: ksix,
              ),
              SizedBox(height: height * 0.036),
              Container(
                padding: EdgeInsets.only(
                  top: height * 0.002,
                  left: width / 20,
                  right: width / 20,
                ),
                height: height * 0.12,
                width: width,
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: "Reel/Youtube/Tiktok",
                          size: 14 * sp,
                          color: kgrey8,
                          weight: ksix,
                        ),
                        SizedBox(height: height * 0.007),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: r'$25/ ', style: styleprimary),
                              TextSpan(text: 'video', style: stylegrey),
                            ],
                          ),
                        )
                      ],
                    ),
                    SvgPicture.asset('assets/icons/forwardPrimary.svg')
                  ],
                ),
              ),
              SizedBox(height: height * 0.016),
              Container(
                padding: EdgeInsets.only(
                  top: height * 0.002,
                  left: width / 20,
                  right: width / 20,
                ),
                height: height * 0.12,
                width: width,
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: "Reel/Youtube/Tiktok",
                          size: 14 * sp,
                          color: kgrey8,
                          weight: ksix,
                        ),
                        SizedBox(height: height * 0.007),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: r'$100/ ', style: styleprimary),
                              TextSpan(text: 'video', style: stylegrey),
                            ],
                          ),
                        )
                      ],
                    ),
                    SvgPicture.asset('assets/icons/forwardPrimary.svg')
                  ],
                ),
              ),
              SizedBox(height: height * 0.046),
              Container(
                decoration: BoxDecoration(boxShadow: [kshadow]),
                height: height * 0.07,
                width: width,
                child: MyButton(
                  text: 'Continue',
                  onPress: () {
                    Get.toNamed(Routes.GET_QUOTE_TWO);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
