import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:space_x_launches/domain/blocs/space_api_bloc.dart';
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
    return BlocProvider(
      create: (_) => SpaceApiBloc()..add(LoadLaunchesEvent(
          index: context.read<PageNumberProvider>().pageNumber,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SpaceX Launches',
            style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w300,
            ),
          ),
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RocketImageSlider(),
            PageIndicator(),
            BodyTitleWidget(),
            BodyLaunchesWidget(),
          ],
        ),
      ),
    );
  }
}
