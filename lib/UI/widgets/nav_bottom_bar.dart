import 'package:flutter/material.dart';
import 'package:tasks/UI/widgets/body.dart';

import '../../logic/bloc_export.dart';

// ignore: must_be_immutable, I don't need to make this class immutabel
class NavBottomBar extends StatefulWidget {
  bool isLight = true;

  NavBottomBar({super.key, required this.isLight});
  @override
  State<NavBottomBar> createState() => _NavBottomBarState();
}

class _NavBottomBarState extends State<NavBottomBar> {
  int index = 0;
  bool? isLight = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchThemeBloc, SwitchState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: 0,

          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),

          unselectedLabelStyle: const TextStyle(
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
      context.read<SwitchThemeBloc>().add(Onevent());

      setState(() {
        isLight = false;
        BodyList(isLight: false);
      });
    } else {
      context.read<SwitchThemeBloc>().add(Offevent());
      setState(() {
        isLight = true;
        BodyList(isLight: true);
      });
    }
  }
}
