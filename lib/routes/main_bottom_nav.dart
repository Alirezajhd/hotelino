import 'package:Hotelino/routes/test.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  _buildScreens() {
    return [HomeScreen(), BookinPage(), LikePage(), Porfile()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/nav_home.svg",
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveIcon: SvgPicture.asset(
          "assets/images/nav_home.svg",
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/nav_booking.svg",
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveIcon: SvgPicture.asset(
          "assets/images/nav_booking.svg",
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/nav_favorite.svg",
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveIcon: SvgPicture.asset(
          "assets/images/nav_favorite.svg",
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/images/nav_profile.svg",
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveIcon: SvgPicture.asset(
          "assets/images/nav_profile.svg",
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      controller: _controller,
      items: [..._navBarsItems()],
      onItemSelected: (value) {
        setState(() {
          _controller.index = value;
        });
      },
    );
  }
}
