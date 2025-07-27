import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smile_fokus_test/Utils/configuration.dart';

part 'point_event.dart';
part 'point_state.dart';

class PointBloc extends Bloc<PointEvent, PointsState> {
  PointBloc() : super(PointsState(points: 0)) {
    _loadInitialPoint();

    //Update Point Function
    on<UpdatePointsEvent>((event, emit) async {
      final updatedPoints = state.points - event.rewardPoints;
      emit(state.copyWith(points: updatedPoints));
      await Configuration.setPoint(updatedPoints);
    });
  }

  Future<void> _loadInitialPoint() async {
    final point = await Configuration.point;
    emit(PointsState(points: point));
  }
}
