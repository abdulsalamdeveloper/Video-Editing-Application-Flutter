import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/widgets/elevated_button_widget.dart';
import '../../../../widgets/box_shadow.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/my_text.dart';

class GetQuoteEightView extends StatefulWidget {
  const GetQuoteEightView({Key? key}) : super(key: key);

  @override
  State<GetQuoteEightView> createState() => _GetQuoteEightViewState();
}

class _GetQuoteEightViewState extends State<GetQuoteEightView> {
  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getUsers();

  String buttonText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    buttonText = sharedPreferences.getString('buttonText') ?? '';
    setState(() {});
  }

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
                text: "What sizes would you like your videos",
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
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.049),
              decoration: BoxDecoration(boxShadow: [kshadow]),
              width: width,
              height: height * 0.07,
              child: MyButton(
                text: 'back to ${buttonText.toString()}',
                onPress: () async {
                  Get.toNamed(Routes.GET_QUOTE_ON_THE_WAY);
                  SharedPreferences shared =
                      await SharedPreferences.getInstance();
                  shared.clear();
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
      SizedBox(
        height: height * 0.024,
        width: width * 0.024,
        child: checkBox,
      ),
      SizedBox(
        width: width * 0.04,
      ),
      MyText(
        text: '$text',
        size: 14 * sp,
        color: kgrey8,
        weight: kfour,
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
      CheckBoxListTileModel(userId: 1, title: "Vertical", isCheck: true),
      CheckBoxListTileModel(userId: 2, title: "Horizontal", isCheck: false),
      CheckBoxListTileModel(userId: 3, title: "Square", isCheck: false),
      CheckBoxListTileModel(
          userId: 5, title: "All of the above", isCheck: false),
    ];
  }
}
