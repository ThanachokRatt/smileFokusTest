import 'package:flutter/material.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';
import 'package:smile_fokus_test/components/custom_button.dart';
import 'package:smile_fokus_test/components/custom_textField.dart';
import 'package:smile_fokus_test/extension/text_styles.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Text(
                    GetString.appTitle,
                    style: SetStyle.sarabunBold(AppFonts.superLarge),
                  ),
                  SizedBox(height: AppPaddings.large),
                  //Username TextField
                  CustomTextField(
                    controller: _usernameController,
                    hintText: GetString.email,
                    textStyle: SetStyle.sarabunRegular(AppFonts.medium),
                    hintStyle: SetStyle.sarabunRegular(
                      AppFonts.medium,
                    ).copyWith(color: kPrimaryGray),
                    borderColor: kPrimaryGray,
                    onChanged: (value) {
                      print('Current Username : $value');
                    },
                  ),
                  SizedBox(height: AppPaddings.small),
                  //Password TextField
                  CustomTextField(
                    controller: _passwordController,
                    hintText: GetString.password,
                    textStyle: SetStyle.sarabunRegular(AppFonts.medium),
                    hintStyle: SetStyle.sarabunRegular(
                      AppFonts.medium,
                    ).copyWith(color: kPrimaryGray),
                    borderColor: kPrimaryGray,
                    obscureText: true,
                    onChanged: (value) {
                      print('Current Password : $value');
                    },
                  ),
                  SizedBox(height: AppPaddings.superLarge),
                  //Sign In Button
                  CustomButton(
                    text: GetString.signIn,
                    bgColor: kSolidBlack,
                    onPressed: () {
                      print('tap sign In');
                    },
                    textStyle: SetStyle.sarabunBold(
                      AppFonts.large,
                    ).copyWith(color: kWhiteColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
