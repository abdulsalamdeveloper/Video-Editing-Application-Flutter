import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import '../controllers/project_details_controller.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/my_text.dart';

class ProjectDetailsView extends GetView<ProjectDetailsController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    var get = height * 0.024;

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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: height / 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.CHECK_OUT);
                    },
                    child: buildProjectTitleContainer(height, width, sp)),
                SizedBox(height: height * 0.001),
                ...List.generate(
                    2,
                    (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildDesciptionContainer(height, width, sp,
                                projectNumber: '${index + 1}'),
                            SizedBox(height: height * 0.013),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.062),
                              child: MyText(
                                text: "What sizes would you like your videos",
                                size: 16 * sp,
                                color: Color(0xff000000),
                                weight: ksix,
                              ),
                            ),
                            SizedBox(height: height * 0.013),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.052),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildCheck(sp, text: 'Vertical'),
                                  buildCheck(sp, text: 'Horizontal'),
                                  buildCheck(sp, text: 'Square'),
                                  buildCheck(sp, text: 'All of the above'),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.013),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.062),
                              child: MyText(
                                text:
                                    "Please check off everything you would want for editing",
                                size: 16 * sp,
                                color: kgrey8,
                                weight: kfive,
                              ),
                            ),
                            SizedBox(height: height * 0.013),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.052),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildCheck(sp, text: 'Colour Grading'),
                                  buildCheck(sp, text: 'Animations'),
                                  buildCheck(sp, text: 'Custom Subtitles'),
                                  buildCheck(sp, text: 'Special effects/ VFX'),
                                  buildCheck(sp, text: 'Copyright Free Music'),
                                  buildCheck(sp, text: 'Transitions'),
                                  buildCheck(sp, text: 'Motion Graphics'),
                                ],
                              ),
                            ),
                          ],
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildCheck(double sp, {required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RoundCheckBox(
          size: 30,
          isChecked: false,
          uncheckedColor: Colors.transparent,
          checkedColor: Colors.transparent,
          checkedWidget: Icon(
            Icons.check,
            color: Color(0xff33B469),
          ),
          uncheckedWidget: Icon(
            Icons.check,
            color: Colors.grey[400],
          ),
          borderColor: Color(0xffF9F9FB),
          onTap: (selected) {},
        ),
        SizedBox(
          width: Checkbox.width * 0.3,
        ),
        MyText(
          text: '$text',
          size: 14 * sp,
          weight: kfour,
          color: Color(0xff000000),
        )
      ],
    );
  }

  Container buildDesciptionContainer(double height, double width, double sp,
      {required String projectNumber}) {
    return Container(
      padding: EdgeInsets.only(
        top: height * 0.02,
        left: width * 0.05,
        right: width * 0.05,
        bottom: height * 0.02,
      ),
      margin: EdgeInsets.only(
          left: width * 0.049, right: width * 0.049, top: height * 0.028),
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              color: Color(0xff0000000A).withOpacity(0.04),
              blurRadius: 15.0,
              spreadRadius: 0.0),
        ],
        color: kwhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: 'Video #$projectNumber',
            size: 16 * sp,
            weight: ksix,
            color: kblack,
          ),
          SizedBox(height: height * 0.015),
          buildDescription(
            sp,
            height,
            title: 'Estimated minutes',
            descrip: '1-30 minutes',
          ),
          SizedBox(height: height * 0.015),
          buildDescription(
            sp,
            height,
            title: 'Drive link',
            descrip:
                'https://drive.google.com/file/d/1kazyfB4JHoZSmczN-FBVXB4C8qN5b46G/view?usp=sharing',
          ),
          SizedBox(height: height * 0.015),
          buildDescription(
            sp,
            height,
            title: 'Description',
            descrip:
                'That\'s why you want to write long, thorough video descriptions (at least 200 words). YouTube\'s algorithm puts more weight on keywords that show up in the first 2-3 sentences of your description. In fact, YouTube recommends that you: “Put the most important keywords toward the beginning of your description”',
          ),
        ],
      ),
    );
  }

  Column buildDescription(double sp, double height,
      {required String title, required String descrip}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: '$title',
          size: 14 * sp,
          weight: ksix,
          color: kgrey8,
        ),
        SizedBox(height: height * 0.01),
        MyText(
          align: TextAlign.left,
          text: '$descrip',
          size: 14 * sp,
          weight: kfour,
          color: kgrey8,
        ),
      ],
    );
  }

  Container buildProjectTitleContainer(double height, double width, double sp) {
    return Container(
        padding: EdgeInsets.only(
          top: height * 0.024,
          left: width * 0.05,
          right: width * 0.05,
          bottom: height * 0.005,
        ),
        margin: EdgeInsets.only(
            left: width * 0.049, right: width * 0.049, top: height * 0.028),
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                color: Color(0xff0000000A).withOpacity(0.04),
                blurRadius: 15.0,
                spreadRadius: 0.0),
          ],
          color: kwhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: 'Project title',
              size: 16 * sp,
              weight: ksix,
              color: kblack,
            ),
            SizedBox(height: height * 0.015),
            buildRow(sp, leftText: 'Total video', rightText: '2'),
            SizedBox(height: height * 0.015),
            buildRow(sp, leftText: 'Type', rightText: 'Personal'),
            SizedBox(height: height * 0.015),
            buildRow(sp,
                leftText: 'Assigned date', rightText: '20 Sept 2022, 06:23 PM'),
            SizedBox(height: height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MyText(
                    text: 'Project stats',
                    size: 14 * sp,
                    weight: kfour,
                    color: kblack,
                  ),
                ),
                FittedBox(
                  child: Container(
                    height: height * 0.03,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    decoration: BoxDecoration(
                      color: kwarning.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(38),
                    ),
                    child: Center(
                      child: MyText(
                        text: 'Quote',
                        size: 10 * sp,
                        weight: kfour,
                        color: kwarning,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }

  Row buildRow(double sp,
      {required String leftText, required String rightText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: MyText(
            text: '$leftText',
            size: 14 * sp,
            weight: kfour,
            color: kblack,
          ),
        ),
        SizedBox(),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: MyText(
              align: TextAlign.right,
              text: '$rightText',
              size: 14 * sp,
              weight: ksix,
              color: kblack,
            ),
          ),
        ),
      ],
    );
  }
}
