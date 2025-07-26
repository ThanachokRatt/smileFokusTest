part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginPressedEvent extends LoginEvent {
  final String username;
  final String password;

  LoginPressedEvent(this.username, this.password);
  @override
  List<Object?> get props => [username, password];
}
