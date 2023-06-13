import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:space_x_launches/data/models/launch.dart';
import 'package:space_x_launches/data/models/rocket.dart';
import 'package:space_x_launches/data/services/space_x_service.dart';

part 'launches_event.dart';
part 'launches_state.dart';

///Bloc for launches data working between data and presentation layer
///Accepts an event and returns a state
class LaunchesBloc extends Bloc<LaunchesEvent, LaunchesState> {
  final SpaceXService _apiService = SpaceXService();

  ///Bloc logic
  // ignore: sort_constructors_first
  LaunchesBloc() : super(LaunchesInitialState()) {
    on<LoadLaunchesEvent>((event, emit) async {
      try{
        emit(LaunchesInitialState());
        await _apiService.fetchLaunches(event.index);
        emit(LaunchesLoadedState(
          rocketsList: SpaceXService.rocketsList,
          launchesList: SpaceXService.launchesList,
        ),
        );
      } catch (e) {
        emit(LaunchesErrorState(error: e.toString()));
      }
    });
  }

}
