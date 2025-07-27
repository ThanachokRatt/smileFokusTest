import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smile_fokus_test/models/home/reward_item_model.dart';

part 'wish_lish_event.dart';
part 'wish_lish_state.dart';

class WishListBloc extends Bloc<WishLishEvent, WishListState> {
  WishListBloc() : super(WishLishInitial()) {
    ///Update whist list data
    on<UpdateWishListEvent>((event, emit) {
      final currentList = state is WishListUpdatedState
          ? List<RewardItem>.from((state as WishListUpdatedState).modelList)
          : <RewardItem>[];

      final exists = currentList.any((item) => item.id == event.item.id);

      if (!exists) {
        ///Add data
        currentList.add(event.item);
      } else {
        ///Delete data
        currentList.removeWhere((item) => item.id == event.item.id);
      }

      emit(WishListUpdatedState(currentList));
    });
  }
}
