import 'package:Hotelino/features/home/presentation/homePage.dart';
import 'package:Hotelino/routes/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    BookinPage(),
    LikePage(),
    Porfile(),
  ];

  @override
  void initState() {
    super.initState();
  }
  
  Widget _buildNavItem(String assetPath, bool isActive) {
    return SvgPicture.asset(
      assetPath,
      height: 22,
      width: 22,
      colorFilter: ColorFilter.mode(
        isActive ? Colors.white : Colors.white.withOpacity(0.7),
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        color: Theme.of(context).colorScheme.primaryFixed,
        buttonBackgroundColor: Theme.of(context).colorScheme.primaryFixed,
        height: 60,
        index: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          _buildNavItem("assets/images/nav_home.svg", _selectedIndex == 0),
          _buildNavItem("assets/images/nav_booking.svg", _selectedIndex == 1),
          _buildNavItem("assets/images/nav_favorite.svg", _selectedIndex == 2),
          _buildNavItem("assets/images/nav_profile.svg", _selectedIndex == 3),
        ],
      ),
    );
  }
}
