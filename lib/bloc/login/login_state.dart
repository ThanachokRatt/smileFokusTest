part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMessages;
  LoginErrorState(this.errorMessages);

  @override
  List<Object?> get props => [errorMessages];
}
