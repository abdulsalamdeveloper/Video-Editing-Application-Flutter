import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/ChatView/views/chat_view_view.dart';
import 'package:video_editing_app/constants/colors.dart';

import '../../../../widgets/willpop.dart';
import '../../BottomProfile/views/bottom_profile_view.dart';
import '../../Order/views/order_view.dart';
import '../../Profile/views/profile_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/bottom_bar_controller.dart';

class BottomBarView extends GetView<BottomBarController> {
  final TextStyle unselectedLabelStyle =
      TextStyle(color: kgrey5, fontWeight: FontWeight.w400, fontSize: 10);

  final TextStyle selectedLabelStyle = TextStyle(
      color: kprimaryColor, fontWeight: FontWeight.w400, fontSize: 10);

  buildBottomNavigationMenu(context, landingPageController) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Container(
          height: 79,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 30,
                color: Color(0xffD1D1D1).withOpacity(0.25),
                offset: Offset(0, -10))
          ]),
          child: BottomNavigationBar(
            backgroundColor: kwhite,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            unselectedItemColor: Color(0xff838383),
            selectedItemColor: kprimaryColor,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/home.svg",
                    color: Color(0xff838383),
                  ),
                ),
                label: 'Home',
                backgroundColor: kwhite,
                activeIcon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/home.svg",
                    color: kprimaryColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/chat.svg",
                    color: Color(0xff838383),
                  ),
                ),
                label: 'Chat',
                backgroundColor: kwhite,
                activeIcon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/chat.svg",
                    color: kprimaryColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/order.svg",
                    color: Color(0xff838383),
                  ),
                ),
                label: 'Order',
                backgroundColor: kwhite,
                activeIcon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/order.svg",
                    color: kprimaryColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/profile.svg",
                    color: Color(0xff838383),
                  ),
                ),
                label: 'Profile',
                backgroundColor: kwhite,
                activeIcon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/profile.svg",
                    color: kprimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomBarController landingPageController =
        Get.put(BottomBarController(), permanent: false);
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return onBackButtonPressed(context);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar:
              buildBottomNavigationMenu(context, landingPageController),
          body: Obx(
            () => IndexedStack(
              index: landingPageController.tabIndex.value,
              children: [
                HomeView(),
                ChatViewView(),
                OrderView(),
                BottomProfileView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
