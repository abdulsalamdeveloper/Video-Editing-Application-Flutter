import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/box_shadow.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../../widgets/my_text.dart';
import '../../../routes/app_pages.dart';
import '../controllers/get_quote_five_controller.dart';

class GetQuoteFiveView extends GetView<GetQuoteFiveController> {
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
              children: [
                SizedBox(height: height * 0.040),
                GetBuilder<GetQuoteFiveController>(
                  builder: (controller) => Column(
                    children: [
                      ...List.generate(
                        2,
                        (index) => GestureDetector(
                          onTap: () async {
                            controller.changeColor(index);
                            Get.toNamed(Routes.GET_QUOTE_SIX);
                            SharedPreferences shared =
                                await SharedPreferences.getInstance();
                            shared.setString(
                              'buttonText',
                              'Video #${index + 1}',
                            );
                            var getvalue = shared.get('buttonText');
                            print(shared.getString('buttonText'));
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: height * 0.015),
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.049),
                            height: height * 0.076,
                            width: width,
                            decoration: BoxDecoration(
                              color: controller.selectedIndex == index
                                  ? kprimaryColor
                                  : Color(0xffF1EBFF),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.play_circle_outline,
                                  color: controller.selectedIndex == index
                                      ? Color(0xffF9F9FB)
                                      : kprimaryColor,
                                ),
                                SizedBox(width: width * 0.02),
                                MyText(
                                  text: 'Video #${index + 1}',
                                  color: controller.selectedIndex == index
                                      ? Color(0xffF9F9FB)
                                      : kprimaryColor,
                                  size: 14 * sp,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(boxShadow: [kshadow]),
                  width: width,
                  height: height * 0.07,
                  child: MyButton(
                    text: 'Next',
                    onPress: () {
                      Get.toNamed(Routes.GET_QUOTE_SIX);
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
}
