part of 'rockets_bloc.dart';

///Abstract parent class
abstract class RocketsEvent extends Equatable {
  ///Constructor
  const RocketsEvent();
}

///Event  for rockets data loading
@immutable
class LoadRocketsEvent extends RocketsEvent {
  ///Constructor
  const LoadRocketsEvent();
  @override
  List<Object> get props => [];
}
