import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
import "package:weather_app_23/screens/MainPage.dart";
import "package:weather_app_23/screens/components/loading_screen.dart";
import "package:weather_app_23/screens/components/squareTiles.dart";
PersistentTabController _controller = PersistentTabController(initialIndex: 0);
List<Widget> _buildScreens() {
  return [

    LoadingScreen(),
    squareTile(),



  ];
}
List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: CupertinoColors.systemGrey,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.settings),
      title: ("Settings"),
      activeColorPrimary: CupertinoColors.systemGrey,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),

  ];
}
class bottomNav extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: CupertinoColors.activeBlue, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(

        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}