part of 'launches_bloc.dart';

///Abstract parent class to denote
abstract class LaunchesEvent extends Equatable {
  ///Constructor
  const LaunchesEvent();
}

///Event for launches data loading
@immutable
class LoadLaunchesEvent extends LaunchesEvent {
  ///Constructor
  const LoadLaunchesEvent({required this.index});
  ///Index value from page number
  final int index;
  @override
  List<Object> get props => [index];
}
