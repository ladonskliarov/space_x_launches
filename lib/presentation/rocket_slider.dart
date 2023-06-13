import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x_launches/data/models/rocket.dart';
import 'package:space_x_launches/domain/blocs/launches_bloc/launches_bloc.dart';
import 'package:space_x_launches/domain/page_provider.dart';

///Slider widget with rockets images. With stimulation to SpaceApiBloc
class RocketImageSlider extends StatefulWidget {
  ///Constructor
  const RocketImageSlider(
      {required this.rocketsList, super.key,});
  ///Rocket list
  final List<Rocket> rocketsList;

  @override
  State<RocketImageSlider> createState() => _RocketImageSliderState();
}

class _RocketImageSliderState extends State<RocketImageSlider> {
  final PageController _controller = PageController(viewportFraction: 0.75);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5 + 20,
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 12, bottom: 12,
      ),
      child: PageView.builder(
        itemCount: widget.rocketsList.length,
        controller: _controller,
        onPageChanged: (index) {
          context.read<PageNumberProvider>().changePage(index);
          BlocProvider.of<LaunchesBloc>(context).add(LoadLaunchesEvent(
            index: index,
            ),
          );
        },
        itemBuilder: (context, index){
          final scale = context.watch<PageNumberProvider>()
              .pageNumber == index ? 1.0 : 0.9;
          return TweenAnimationBuilder(
            duration: const Duration(milliseconds: 350),
            curve: Curves.ease,
            tween: Tween(begin: scale, end: scale),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox.expand(
                child: Image.network(
                  widget.rocketsList[index].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            builder: (context, value, child){
              return Transform.scale(
                scale: value,
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}
