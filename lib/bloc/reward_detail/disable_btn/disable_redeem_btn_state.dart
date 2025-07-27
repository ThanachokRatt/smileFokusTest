part of 'disable_redeem_btn_cubit.dart';

sealed class DisableRedeemBtnState extends Equatable {
  const DisableRedeemBtnState();
}

final class DisableRedeemBtnInitial extends DisableRedeemBtnState {
  @override
  List<Object> get props => [];
}

final class DisableRedeemState extends DisableRedeemBtnState {
  final bool isDisable;
  DisableRedeemState({required this.isDisable});

  @override
  List<Object> get props => [isDisable];
}
