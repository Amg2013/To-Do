import 'package:flutter/material.dart';
import 'package:tasks/config/locale/app_locale.dart';
import '../../../cubit/switch_theme_cubit.dart';
import 'dart:developer' as dev;
import '../../../../logic/bloc_export.dart';

// ignore: must_be_immutable, I don't need to make this class immutabel
class NavBottomBar extends StatelessWidget {
  NavBottomBar({super.key});
  int index = 0;

  @override
  Widget build(BuildContext context) {
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
      onTap: (index) {
        final cubit = context.read<SwitchThemeCubit>();
        cubit.changeTheme();
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
            icon: const Icon(Icons.nightlight_outlined, size: 25),
            label: 'theme'.tr(context)),
      ],
    );
  }
}
