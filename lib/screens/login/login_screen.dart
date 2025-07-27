import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';
import 'package:smile_fokus_test/bloc/login/login_bloc.dart';
import 'package:smile_fokus_test/components/custom_button.dart';
import 'package:smile_fokus_test/components/custom_dialog.dart';
import 'package:smile_fokus_test/components/custom_textField.dart';
import 'package:smile_fokus_test/extension/text_styles.dart';
import 'package:smile_fokus_test/screens/home/home_screen.dart';
import 'package:smile_fokus_test/screens/main_tab/main_tab_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        backgroundColor: kWhiteColor,
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () {
            //Hide keyboard when tap ui
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Center(
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                ///Show Dialog with error message
                if (state is LoginErrorState) {
                  CustomDialog.showDialogInfo(
                    context: context,
                    alertDescription: state.errorMessages,
                  );
                }

                /// Login Success and navigate to MainTabScreen
                if (state is LoginSuccessState) {
                  //set email & password to empty
                  _usernameController.text = '';
                  _passwordController.text = '';
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (MainTabScreen())),
                  );
                }
              },
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      ///Title Ui
                      buildLoginTitle(),
                      SizedBox(height: AppPaddings.large),

                      ///Username TextField Ui
                      _buildEmailTextField(),
                      SizedBox(height: AppPaddings.small),

                      ///Password TextField Ui
                      buildPasswordTextField(),
                      SizedBox(height: AppPaddings.superLarge),

                      ///Sign In ButtonUi
                      _buildSignInButton(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BlocBuilder _buildSignInButton(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return CustomButton(
          text: GetString.signIn,
          bgColor: kPrimaryOrange,
          onPressed: () {
            context.read<LoginBloc>().add(
              LoginPressedEvent(
                _usernameController.text,
                _passwordController.text,
              ),
            );
          },
          textStyle: SetStyle.sarabunBold(
            AppFonts.large,
          ).copyWith(color: kWhiteColor),
        );
      },
    );
  }

  CustomTextField buildPasswordTextField() {
    return CustomTextField(
      controller: _passwordController,
      hintText: GetString.password,
      textStyle: SetStyle.sarabunRegular(AppFonts.medium),
      hintStyle: SetStyle.sarabunRegular(
        AppFonts.medium,
      ).copyWith(color: kPrimaryGray),
      borderColor: kPrimaryGray,
      obscureText: true,
    );
  }

  CustomTextField _buildEmailTextField() {
    return CustomTextField(
      controller: _usernameController,
      hintText: GetString.email,
      textStyle: SetStyle.sarabunRegular(AppFonts.medium),
      hintStyle: SetStyle.sarabunRegular(
        AppFonts.medium,
      ).copyWith(color: kPrimaryGray),
      borderColor: kPrimaryGray,
    );
  }

  Row buildLoginTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          GetString.smile,
          style: SetStyle.sarabunBold(
            AppFonts.superLarge,
          ).copyWith(color: kPrimaryOrange),
        ),
        Text(
          GetString.reward,
          style: SetStyle.sarabunBold(
            AppFonts.superLarge,
          ).copyWith(color: kSolidBlack),
        ),
      ],
    );
  }
}
