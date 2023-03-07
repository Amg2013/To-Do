import 'package:flutter/material.dart';

import '../../../../config/locale/app_locale.dart';
import '../../../../config/routes/app_routs.dart';
import '../../../../config/themes/app_theme.dart';
import '../../../blocs/Bloc_export.dart';
import '../../../blocs/list_grid_cubit/list_gird_cubit.dart';
import '../../../blocs/list_grid_cubit/list_grid_state.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // const SizedBox(width: 30),

          BlocBuilder<ListToGrideCubit, ListToGrideState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () =>
                      context.read<ListToGrideCubit>().changeStyle(),
                  icon: Icon(state.isList == false
                      ? Icons.pivot_table_chart
                      : Icons.grid_view_outlined));
            },
          ),

          SizedBox(
              child: TextButton(
                  onPressed: () {
                    BlocProvider.of<LocaleCubit>(context).cahngeLanguage('en');
                    AppLocalizations(locale: const Locale('en')).isEnglish();
                  },
                  child: Text('en',
                      style: TextStyle(
                          color: AppThemes.splashColor, fontSize: 16)))),

          /// secd button
          // SizedBox(
          //   child: TextButton(
          //       onPressed: () {
          //         BlocProvider.of<LocaleCubit>(context).cahngeLanguage('ar');
          //         AppLocalizations(locale: const Locale('ar')).isEnglish();
          //       },
          //       child: Text('ar',
          //           style:
          //               TextStyle(color: AppThemes.splashColor, fontSize: 16))),
          // ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
                //'My Tasks',
                'MyTasksONAppBar'.tr(context),
                style: const TextStyle(fontSize: 25)),
          ),

          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.search);
              },
              icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}
