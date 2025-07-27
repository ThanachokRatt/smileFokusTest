part of 'point_bloc.dart';

sealed class PointState extends Equatable {
  const PointState();
  @override
  List<Object> get props => [];
}

final class PointInitial extends PointState {}

class PointsState extends PointState {
  final int points;

  const PointsState({required this.points});

  PointsState copyWith({int? points}) {
    return PointsState(points: points ?? this.points);
  }

  @override
  List<Object> get props => [points];
}
