import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/widgets/elevated_button_widget.dart';
import '../../../../widgets/box_shadow.dart';
import '../controllers/get_quote_seven_controller.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/my_text.dart';

GetQuoteSevenController controller = Get.put(GetQuoteSevenController());

class GetQuoteSevenView extends StatefulWidget {
  const GetQuoteSevenView({Key? key}) : super(key: key);

  @override
  State<GetQuoteSevenView> createState() => _GetQuoteSevenViewState();
}

class _GetQuoteSevenViewState extends State<GetQuoteSevenView> {
  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getUsers();
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.040),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.049),
              child: MyText(
                text: "Please check off everything you would want for editing",
                size: 16 * sp,
                color: kblack,
                weight: kfive,
              ),
            ),
            SizedBox(height: height * 0.015),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.029),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: checkBoxListTileModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      CheckboxListTile(
                        checkColor: kwhite,
                        visualDensity: VisualDensity(
                          horizontal: 0,
                          vertical: -4,
                        ),
                        contentPadding: EdgeInsets.zero,
                        checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: BorderSide(
                          width: 2,
                          color: kgrey3,
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: kprimaryColor,
                        dense: true,
                        //font change
                        title: Text(
                          checkBoxListTileModel[index].title,
                          style: TextStyle(
                            fontSize: 14 * sp,
                            fontWeight: kfour,
                            color: kgrey8,
                            fontFamily: 'WorkSans',
                          ),
                        ),
                        value: checkBoxListTileModel[index].isCheck,
                        onChanged: (val) {
                          itemChange(val!, index);
                        },
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: height * 0.020),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.049),
              child: MyText(
                text:
                    "Please note, the more you add the higher the price can be",
                size: 16 * sp,
                color: kgrey8,
                weight: kfour,
              ),
            ),
            SizedBox(height: height * 0.040),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.049),
              decoration: BoxDecoration(boxShadow: [kshadow]),
              width: width,
              height: height * 0.07,
              child: MyButton(
                text: 'Next',
                onPress: () {
                  Get.toNamed(Routes.GET_QUOTE_EIGHT);
                },
              ),
            ),
            SizedBox(height: height * 0.05)
          ],
        ),
      ),
    );
  }

  void itemChange(bool val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val;
    });
  }
}

Row buildRow(double height, double width, double sp,
    {required String text, required var checkBox}) {
  return Row(
    children: [
      Expanded(
        child: SizedBox(
          // height: height * 0.024,
          // width: width * 0.024,
          child: checkBox,
        ),
      ),
      SizedBox(width: width * 0.04),
      Expanded(
        child: MyText(
          text: '$text',
          size: 14 * sp,
          color: kgrey8,
          weight: kfour,
        ),
      )
    ],
  );
}

class CheckBoxListTileModel {
  int userId;
  String title;
  bool isCheck;

  CheckBoxListTileModel(
      {required this.userId, required this.title, required this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(userId: 1, title: "Colour Grading", isCheck: true),
      CheckBoxListTileModel(userId: 2, title: "Animations", isCheck: false),
      CheckBoxListTileModel(
          userId: 3, title: "Custom Subtitles", isCheck: false),
      CheckBoxListTileModel(
          userId: 4, title: "Special effects/ VFX", isCheck: false),
      CheckBoxListTileModel(
          userId: 5, title: "Copyright Free Music", isCheck: false),
      CheckBoxListTileModel(userId: 5, title: "Transitions", isCheck: false),
      CheckBoxListTileModel(
          userId: 5, title: "Motion Graphics", isCheck: false),
    ];
  }
}
