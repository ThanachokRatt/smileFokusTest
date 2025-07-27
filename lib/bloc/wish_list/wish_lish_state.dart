part of 'wish_lish_bloc.dart';

sealed class WishListState extends Equatable {
  const WishListState();
  @override
  List<Object?> get props => [];
}

final class WishLishInitial extends WishListState {}

class WishListUpdatedState extends WishListState {
  final List<RewardItem> modelList;

  const WishListUpdatedState(this.modelList);

  @override
  List<Object?> get props => [modelList];
}
