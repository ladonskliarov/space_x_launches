part of 'space_api_bloc.dart';

///Abstract parent class to denote
abstract class SpaceApiState extends Equatable {
  ///Constructor
  const SpaceApiState();
}

///Initial class state for page
class SpaceApiInitialState extends SpaceApiState {
  @override
  List<Object> get props => [];
}

///Loaded data class state for page
@immutable
class SpaceApiLoadedState extends SpaceApiState {

  ///Constructor
  const SpaceApiLoadedState({required this.listLaunches});

  ///List of launches
  final List<Launch> listLaunches;
  @override
  List<Object> get props => [listLaunches];
}

///Error class state for page
@immutable
class SpaceApiErrorState extends SpaceApiState {

  ///Constructor
  const SpaceApiErrorState({required this.error});

  ///Error value
  final String error;
  @override
  List<Object> get props => [error];
}
