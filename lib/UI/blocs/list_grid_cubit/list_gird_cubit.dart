import '../../../logic/bloc_export.dart';
import 'list_grid_state.dart';

class ListToGrideCubit extends Cubit<ListToGrideState> {
  ListToGrideCubit() : super(ListToGrideState(isList: true));

  void changeStyle() {
    if (state.isList == true) {
      // final ThemeData? themeDataDark = AppThemes.appThemeData[AppTheme.darkTheme];
      final updateState = ListToGrideState(isList: false);
      emit(updateState);
    } else {
      final updateState = ListToGrideState(isList: true);
      emit(updateState);
    }
  }
}
