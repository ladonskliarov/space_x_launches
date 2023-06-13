part of 'rockets_bloc.dart';

///Abstract parent class to denote
abstract class RocketsState extends Equatable {
  ///Constructor
  const RocketsState();
}

///Initial state for page
@immutable
class RocketsInitialState extends RocketsState {
  @override
  List<Object> get props => [];
}

///Loaded rockets data state for page
@immutable
class RocketsLoadedState extends RocketsState {
  ///Constructor
  const RocketsLoadedState({required this.rocketsList});
  ///Class fields
  final List<Rocket> rocketsList;
  @override
  List<Object> get props => [];
}

///Error state for page
@immutable
class RocketsErrorState extends RocketsState {
  ///Constructor
  const RocketsErrorState({required this.error});
  ///Class fields
  final String error;
  @override
  List<Object> get props => [error];
}
