import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';
import 'package:smile_fokus_test/Utils/configuration.dart';
import 'package:smile_fokus_test/bloc/Home/point/point_bloc.dart';
import 'package:smile_fokus_test/screens/home/home_screen.dart';
import 'package:smile_fokus_test/screens/login/login_screen.dart';
import 'package:smile_fokus_test/screens/main_tab/main_tab_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool isLogin = await Configuration.isLogin;
  runApp(MyApp(isLogin: isLogin));
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  const MyApp({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PointBloc(),
      child: MaterialApp(
        title: GetString.appTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryBlue),
        ),
        home: isLogin ? MainTabScreen() : LoginScreen(),
      ),
    );
  }
}
