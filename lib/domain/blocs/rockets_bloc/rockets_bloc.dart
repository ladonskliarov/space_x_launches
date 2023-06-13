import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:space_x_launches/data/models/rocket.dart';
import 'package:space_x_launches/data/services/space_x_service.dart';

part 'rockets_event.dart';
part 'rockets_state.dart';

///Bloc for rockets data working between data and presentation layer
///Accepts an event and returns a state
class RocketsBloc extends Bloc<RocketsEvent, RocketsState> {
  final SpaceXService _apiService = SpaceXService();
  ///
  // ignore: sort_constructors_first
  RocketsBloc() : super(RocketsInitialState()) {
    on<RocketsEvent>((event, emit) async {
      try{
        emit(RocketsInitialState());
        await _apiService.fetchRockets();
        emit(RocketsLoadedState(
          rocketsList: SpaceXService.rocketsList,
          ),
        );
      } catch (e) {
        emit(RocketsErrorState(error: e.toString()));
      }
    });
  }
}
