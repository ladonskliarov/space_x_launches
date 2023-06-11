import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:space_x_launches/data/models/launch.dart';
import 'package:space_x_launches/data/services/space_x_service.dart';

part 'space_api_event.dart';
part 'space_api_state.dart';

///Main Bloc working between data and presentation layer
///Accepts an event and returns a state
class SpaceApiBloc extends Bloc<SpaceApiEvent, SpaceApiState> {
  final SpaceXService _apiService = SpaceXService();

  ///Bloc logic
  // ignore: sort_constructors_first
  SpaceApiBloc() : super(SpaceApiInitialState()) {
    on<LoadLaunchesEvent>((event, emit) async {
      try{
        emit(SpaceApiInitialState());
        await _apiService.fetchMissions(event.index);
        emit(SpaceApiLoadedState(listLaunches: _apiService.launchesList));
      } catch (e) {
        emit(SpaceApiErrorState(error: e.toString()));
      }
    });
  }

}
