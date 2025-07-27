import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';
import 'package:smile_fokus_test/bloc/main_tab_bar/main_tab_bar_dart_cubit.dart';
import 'package:smile_fokus_test/extension/text_styles.dart';
import 'package:smile_fokus_test/screens/home/home_screen.dart';
import 'package:smile_fokus_test/screens/whist_list/whist_list_screen.dart';

class MainTabScreen extends StatelessWidget {
  MainTabScreen({super.key});
  final List<Widget> pages = [HomeScreen(), WhistListScreen()];

  @override
  Widget build(BuildContext context) {
    //Declare Bloc
    return BlocProvider(
      create: (context) => MainTabBarCubit(),
      child: BlocBuilder<MainTabBarCubit, MainTabBarState>(
        builder: (context, state) {
          /// Set Default screen = HomeScreen
          int selectedIndex = 0;
          if (state is TabBarSelected) {
            selectedIndex = state.selectedIndex;
          }
          return Scaffold(
            backgroundColor: kWhiteColor,
            body: IndexedStack(index: selectedIndex, children: pages),
            bottomNavigationBar: Theme(
              data: ThemeData(
                splashColor: Colors.transparent, // close splash effect
                highlightColor: Colors.transparent, // close highlight effect
                splashFactory: NoSplash.splashFactory, // close splash factory
              ),
              child: BottomNavigationBar(
                backgroundColor: kWhiteColor,
                currentIndex: selectedIndex,
                onTap: (index) {
                  /// Update select tab event to switch screen
                  context.read<MainTabBarCubit>().selectTab(index);
                },
                selectedItemColor: kPrimaryOrange,
                unselectedItemColor: kPrimaryGray,
                selectedLabelStyle: SetStyle.sarabunBold(AppFonts.medium),
                unselectedLabelStyle: SetStyle.sarabunBold(AppFonts.medium),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      size: AppSize.sizeIcon,
                      color: selectedIndex == 0 ? kPrimaryOrange : kPrimaryGray,
                    ),
                    label: GetString.home,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      size: AppSize.sizeIcon,
                      color: selectedIndex == 1 ? kPrimaryOrange : kPrimaryGray,
                    ),
                    label: GetString.whistList,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
