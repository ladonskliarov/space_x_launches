part of 'launches_bloc.dart';

///Abstract parent class
abstract class LaunchesState extends Equatable {
  ///Constructor
  const LaunchesState();
}

///Initial state for page
class LaunchesInitialState extends LaunchesState {
  @override
  List<Object> get props => [];
}

///Loaded launches data state for page
@immutable
class LaunchesLoadedState extends LaunchesState {

  ///Constructor
  const LaunchesLoadedState({
    required this.rocketsList,
    required this.launchesList,
  });

  ///Rockets list
  final List<Rocket> rocketsList;
  ///Launches list
  final List<Launch> launchesList;
  @override
  List<Object> get props => [rocketsList, launchesList];
}

///Error state for page
@immutable
class LaunchesErrorState extends LaunchesState {

  ///Constructor
  const LaunchesErrorState({required this.error});

  ///Error value
  final String error;
  @override
  List<Object> get props => [error];
}
