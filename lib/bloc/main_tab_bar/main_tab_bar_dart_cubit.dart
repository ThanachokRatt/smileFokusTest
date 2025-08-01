import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_tab_bar_dart_state.dart';

class MainTabBarCubit extends Cubit<MainTabBarState> {
  MainTabBarCubit() : super(MainTabBarDartInitial());

  ///For switch screen in MainTabBarScreen
  void selectTab(int index) {
    emit(TabBarSelected(selectedIndex: index));
  }
}
