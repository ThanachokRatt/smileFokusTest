part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeSuccessState extends HomeState {
  final List<RewardItem> modelList;
  final String userName;
  HomeSuccessState({required this.modelList,required this.userName});
  @override
  List<Object?> get props => [HomeSuccessState];
}
