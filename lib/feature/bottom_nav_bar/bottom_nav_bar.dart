import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ts_training_demo_ca/core/constant/color/custom_color.dart';
import 'package:ts_training_demo_ca/feature/cart/presentation/pages/cart_page.dart';
import 'package:ts_training_demo_ca/feature/profile/profile_page.dart';

import '../../core/constant/string/custom_string.dart';
import '../dashboard/presentation/pages/dashboard.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;

  const BottomNavBar({super.key, this.initialIndex=0});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> _pages = const [
    Dashboard(),
    Center(child: Text(CustomString.play)),
    Center(child: Text(CustomString.category),),
    CartPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GNav(
          selectedIndex: _selectedIndex,
          onTabChange: _onItemTapped,
          haptic: true,
          tabBorderRadius: 15,
          tabActiveBorder: Border.all(color: CustomColor.general, width: 1),
          tabBorder: Border.all(color: CustomColor.textSecondary, width: 1),
          curve: Curves.easeOutExpo,
          duration:  Duration(milliseconds: 500),
          gap: 8,
          color: CustomColor.info,
          activeColor: CustomColor.secondary,
          iconSize: 24,
          tabBackgroundColor: CustomColor.flip.withOpacity(0.2),
          padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          tabs: [
            GButton(icon: MdiIcons.home, text: CustomString.home),
            GButton(icon: MdiIcons.play, text: CustomString.play),
            GButton(icon: MdiIcons.viewDashboard, text: CustomString.category),
            GButton(icon: MdiIcons.cart, text:CustomString.cart),
            GButton(icon: MdiIcons.account, text:CustomString.profile),
          ],
        ),
      ),
    );
  }
}