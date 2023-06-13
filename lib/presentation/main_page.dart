import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x_launches/domain/blocs/launches_bloc/launches_bloc.dart';
import 'package:space_x_launches/domain/blocs/rockets_bloc/rockets_bloc.dart';

import 'package:space_x_launches/domain/page_provider.dart';
import 'package:space_x_launches/presentation/body_launches.dart';
import 'package:space_x_launches/presentation/body_title.dart';
import 'package:space_x_launches/presentation/page_indicator.dart';
import 'package:space_x_launches/presentation/rocket_slider.dart';

///Main page
class MainPage extends StatefulWidget {
  ///Constructor
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) =>
          RocketsBloc()..add(const LoadRocketsEvent()),
        ),
        BlocProvider(
          create: (context) => LaunchesBloc()..add(LoadLaunchesEvent(
          index: context.read<PageNumberProvider>().pageNumber,
            ),
          ),
        )],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SpaceX Launches',
            style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w300,
            ),
          ),
        ),
        body: BlocBuilder<RocketsBloc, RocketsState>(
            builder: (context, state) {
              if (state is RocketsLoadedState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RocketImageSlider(rocketsList: state.rocketsList),
                    PageIndicator(rocketsListLength: state.rocketsList.length,),
                    const BodyTitleWidget(),
                    const BodyLaunchesWidget(),
                  ],
                );
              } else if (state is RocketsErrorState) {
                return Center(
                  child: Text(
                    state.error,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                );
              } else if (state is LaunchesInitialState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
        ),
      ),
    );
  }
}
