part of 'space_api_bloc.dart';

///Abstract parent class to denote
abstract class SpaceApiEvent extends Equatable {
  ///Constructor
  const SpaceApiEvent();
}

///Event class for data loading
@immutable
class LoadLaunchesEvent extends SpaceApiEvent {
  ///Constructor
  const LoadLaunchesEvent({required this.index});
  ///Index value from page number
  final int index;
  @override
  List<Object> get props => [index];
}
