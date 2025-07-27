part of 'wish_lish_bloc.dart';

sealed class WishLishEvent extends Equatable {
  const WishLishEvent();
  @override
  List<Object?> get props => [];
}

class UpdateWishListEvent extends WishLishEvent {
  final RewardItem item;
  UpdateWishListEvent(this.item);
  @override
  List<Object?> get props => [item];
}

class RemoveFromWishListEvent extends WishLishEvent {
  final RewardItem item;

  const RemoveFromWishListEvent(this.item);

  @override
  List<Object?> get props => [item];
}
