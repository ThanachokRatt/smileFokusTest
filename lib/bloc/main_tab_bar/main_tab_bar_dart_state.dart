part of 'main_tab_bar_dart_cubit.dart';

sealed class MainTabBarState extends Equatable {
  const MainTabBarState();
}

final class MainTabBarDartInitial extends MainTabBarState {
  @override
  List<Object> get props => [];
}

final class TabBarSelected extends MainTabBarState {
  final int selectedIndex;
  TabBarSelected({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}
