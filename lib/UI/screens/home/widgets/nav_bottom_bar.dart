import 'package:flutter/material.dart';
import 'package:tasks/UI/blocs/Bloc_export.dart';
import '../../../../config/locale/app_locale.dart';
import '../../../blocs/switch_theme_cubit/switch_theme_cubit.dart';

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
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
            icon: const Icon(Icons.nightlight_outlined, size: 25),
            label: 'theme'.tr(context)),
      ],
    );
  }
}
