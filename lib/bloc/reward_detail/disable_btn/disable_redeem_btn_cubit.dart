import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'disable_redeem_btn_state.dart';

class DisableRedeemBtnCubit extends Cubit<DisableRedeemBtnState> {
  DisableRedeemBtnCubit() : super(DisableRedeemBtnInitial());

  void disableRedeemEvent(bool isDisable) {
    emit(DisableRedeemState(isDisable: isDisable));
  }
}
