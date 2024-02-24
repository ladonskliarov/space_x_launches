import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x_launches/domain/blocs/launches_bloc/launches_bloc.dart';


import 'package:space_x_launches/presentation/launch_card.dart';

///Main part of screen, which shows list of launches
class BodyLaunchesWidget extends StatelessWidget {
  ///Constructor
  const BodyLaunchesWidget({super.key});
  

  @override
  Widget build(BuildContext context){
    return BlocBuilder<LaunchesBloc, LaunchesState>(
          builder: (context, state){
            if(state is LaunchesLoadedState){
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 9, right: 9,
                  ),
                  child: ListView.builder(
                    itemCount: state.launchesList.length,
                    itemBuilder: (context, index){
                      return LaunchCardWidget(
                        date: state.launchesList[index].date,
                        time: state.launchesList[index].time,
                        missionName: state.launchesList[index].missionName,
                        launchSiteName: state.launchesList[index]
                            .launchSiteName,
                        wikiPage: state.launchesList[index].wikiPage,
                      );
                    },
                  ),
                ),
              );
            } else if (state is LaunchesErrorState) {
              return Expanded(
                child: Center(
                  child: Text(
                    state.error,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              );
            } else if (state is LaunchesInitialState) {
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
