// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../logic/Bloc_export.dart';

class NavBar extends StatefulWidget {
  bool isLight = true;

  NavBar({required this.isLight});
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  bool? isLight = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchBloc, SwitchState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: 0,
          // selectedItemColor: HexColor("#FF4444").withOpacity(0.7),
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          // unselectedItemColor: AppColors.bottomIconColor,
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          elevation: 0,
          showSelectedLabels: false,
          // var value = true ,
          onTap: (index) => changeTheme(isLight!),

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.nightlight_outlined, size: 25),
                label: "theme"),
          ],
        );
      },
    );
  }

  void changeTheme(bool falge) {
    if (falge == true) {
      context.read<SwitchBloc>().add(Onevent());
      setState(() {
        isLight = false;
      });
    } else {
      context.read<SwitchBloc>().add(Offevent());
      setState(() {
        isLight = true;
      });
    }
  }
}
