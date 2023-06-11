import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:space_x_launches/domain/blocs/space_api_bloc.dart';
import 'package:space_x_launches/presentation/launch_card.dart';

///Main part of screen, which shows list of launches
class BodyLaunchesWidget extends StatelessWidget {
  ///Constructor
  const BodyLaunchesWidget({super.key});

  @override
  Widget build(BuildContext context){
    return BlocBuilder<SpaceApiBloc, SpaceApiState>(
        builder: (context, state){
          if(state is SpaceApiLoadedState){
            return Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 9, right: 9,
                ),
                child: ListView.builder(
                  itemCount: state.listLaunches.length,
                  itemBuilder: (context, index){
                    return LaunchCardWidget(
                      date: state.listLaunches[index].date,
                      time: state.listLaunches[index].time,
                      missionName: state.listLaunches[index].missionName,
                      launchSiteName: state.listLaunches[index]
                          .launchSiteName,
                      wikiPage: state.listLaunches[index].wikiPage,
                    );
                  },
                ),
              ),
            );
          } else if (state is SpaceApiErrorState) {
            return Expanded(
              child: Center(
                child: Text(
                  state.error,
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            );
          } else if (state is SpaceApiInitialState) {
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
    );
  }
}
