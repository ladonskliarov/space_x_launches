import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x_launches/data/rockets_images.dart';
import 'package:space_x_launches/domain/blocs/space_api_bloc.dart';
import 'package:space_x_launches/domain/page_provider.dart';

///Slider widget with rockets images. With stimulation to SpaceApiBloc
class RocketImageSlider extends StatefulWidget {
  ///Constructor
  const RocketImageSlider({super.key});

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
        itemCount: rocketsImages.length,
        controller: _controller,
        onPageChanged: (index) {
          context.read<PageNumberProvider>().changePage(index);
          BlocProvider.of<SpaceApiBloc>(context).add(LoadLaunchesEvent(
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
                child: Image.asset(
                  rocketsImages[index],
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
