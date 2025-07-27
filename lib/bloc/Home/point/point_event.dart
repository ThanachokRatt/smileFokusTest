part of 'point_bloc.dart';

sealed class PointEvent extends Equatable {
  const PointEvent();
  @override
  List<Object?> get props => [];
}

class UpdatePointsEvent extends PointEvent {
  final int rewardPoints;
  UpdatePointsEvent(this.rewardPoints);
}
