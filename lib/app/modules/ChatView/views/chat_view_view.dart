import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_editing_app/app/modules/ChatView/controllers/chat_view_controller.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';

import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/my_text.dart';

ChatViewController controller = Get.put(ChatViewController());

class ChatViewView extends StatefulWidget {
  const ChatViewView({Key? key}) : super(key: key);

  @override
  State<ChatViewView> createState() => _ChatViewViewState();
}

class _ChatViewViewState extends State<ChatViewView>
    with TickerProviderStateMixin {
  List<String> avatars = [
    'assets/icons/josh.png',
    'assets/icons/circle2.png',
    'assets/icons/circle3.png',
    'assets/icons/circle4.png',
    'assets/icons/circle5.png',
    'assets/icons/circle6.png',
    'assets/icons/circle7.png',
    'assets/icons/circle8.png',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffF9F9FB),
          leading: Padding(
            padding: EdgeInsets.only(top: height * 0.04, left: width * 0.02),
            child: MyText(
              text: 'Logo',
              size: 20 * sp,
              weight: ksix,
              color: Color(0xff000000),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.04, right: width / 25),
              child: SvgPicture.asset('assets/icons/notification.svg'),
            )
          ],
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0, color: kprimaryColor),
              insets: EdgeInsets.symmetric(horizontal: width * 0.05),
            ),
            indicatorColor: kprimaryColor,
            labelStyle:
                TextStyle(color: kgrey8, fontWeight: ksix, fontSize: 14 * sp),
            labelColor: kprimaryColor,
            unselectedLabelColor: kgrey8,
            unselectedLabelStyle:
                TextStyle(color: kgrey8, fontWeight: ksix, fontSize: 14 * sp),
            tabs: [
              Tab(
                text: 'Admin',
              ),
              Tab(
                text: 'Editors',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Column(
                children: [
                  SizedBox(height: height * 0.015),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF2F2F3),
                      borderRadius: BorderRadius.circular(26),
                    ),
                    height: height * 0.07,
                    child: Center(
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: controller.searchController,
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
                          hintText: 'Search name',
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.mic_none_outlined,
                            size: 20,
                            color: kgrey8,
                          ),
                          prefixIcon: Icon(
                            Icons.search_outlined,
                            size: 20,
                            color: kgrey8,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.025),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.SEND_MESSAGE),
                    child: Container(
                      height: height * 0.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage('assets/icons/josh.png'),
                                ),
                                SizedBox(
                                  width: width / 40,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: "Josiah Zayner",
                                      size: 14 * sp,
                                      weight: kfour,
                                      color: Color(0xff31383C),
                                    ),
                                    SizedBox(
                                      height: height * 0.003,
                                    ),
                                    MyText(
                                      text: "How are you today?",
                                      size: 14 * sp,
                                      weight: ksix,
                                      color: Color(0xff31383C),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          FittedBox(
                            child: MyText(
                              text: "9.56 AM",
                              size: 12 * sp,
                              weight: kfour,
                              color: Color(0xffA2A2A2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: height * 0.015),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffF2F2F3),
                        borderRadius: BorderRadius.circular(26),
                      ),
                      height: height * 0.07,
                      child: Center(
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: controller.searchController,
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
                            hintText: 'Search name',
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.mic_none_outlined,
                              size: 20,
                              color: kgrey8,
                            ),
                            prefixIcon: Icon(
                              Icons.search_outlined,
                              size: 20,
                              color: kgrey8,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    ...List.generate(
                        avatars.length,
                        (index) => GestureDetector(
                              onTap: () => Get.toNamed(Routes.SEND_MESSAGE),
                              child: Container(
                                margin: EdgeInsets.only(bottom: height * 0.036),
                                height: height * 0.07,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundImage:
                                                AssetImage('${avatars[index]}'),
                                          ),
                                          SizedBox(
                                            width: width / 40,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              MyText(
                                                text: "Josiah Zayner",
                                                size: 14 * sp,
                                                weight: kfour,
                                                color: Color(0xff31383C),
                                              ),
                                              SizedBox(
                                                height: height * 0.003,
                                              ),
                                              MyText(
                                                text: "How are you today?",
                                                size: 14 * sp,
                                                weight:
                                                    index == 0 ? ksix : kfour,
                                                color: Color(0xff31383C),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    FittedBox(
                                      child: MyText(
                                        text: "9.56 AM",
                                        size: 12 * sp,
                                        weight: kfour,
                                        color: Color(0xffA2A2A2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
