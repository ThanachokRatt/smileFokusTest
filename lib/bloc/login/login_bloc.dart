import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smile_fokus_test/Utils/app_constants.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    //Function Validate Credentials
    on<LoginPressedEvent>((event, emit) {
      emit(LoginInitial());

      if (event.username.isEmpty) {
        emit(LoginErrorState(GetString.loginEmailRequired));
        return;
      }

      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(event.username)) {
        emit(LoginErrorState(GetString.loginEmailInvalid));
        return;
      }

      if (event.password.isEmpty) {
        emit(LoginErrorState(GetString.loginPasswordRequired));
        return;
      }

      if (event.password.length != 8 || int.tryParse(event.password) == null) {
        emit(LoginErrorState(GetString.loginPasswordInvalid));
        return;
      }

      if (event.username != GetString.smileEmail ||
          event.password != GetString.smilePassword) {
        emit(LoginErrorState(GetString.loginInvalidCredentials));
        return;
      }

      emit(LoginSuccessState());
    });
  }
}
