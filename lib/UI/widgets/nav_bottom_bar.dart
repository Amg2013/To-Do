import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../logic/bloc_export.dart';
import 'body.dart';

// ignore: must_be_immutable, I don't need to make this class immutabel
class NavBottomBar extends StatelessWidget {
  NavBottomBar({super.key});

  int index = 0;

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
          // why??
          onTap: (index) {
            //context.read<SwitchThemeBloc>().add(ChangeTheme());
            context.read<SwitchThemeBloc>().add(Onevent());
            SwitchThemeBloc.setTheme();
            const SwitchState(switchValue: true);
          },
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

  // void changeTheme(bool falge) {
  //   if (falge == true) {
  //     context.read<SwitchThemeBloc>().add(Onevent());
  //     const SwitchState(switchValue: false);
  //     setState(() {
  //       isLight = false;
  //       BodyList(isLight: false);
  //     });
  //   } else {
  //     context.read<SwitchThemeBloc>().add(Offevent());
  //     const SwitchState(switchValue: true);
  //     setState(() {
  //       isLight = true;
  //       BodyList(isLight: true);
  //     });
  //   }
  // }
}
