import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x_launches/domain/page_provider.dart';

///Page indicator widget
class PageIndicator extends StatelessWidget {
  ///Constructor
  const PageIndicator({
    required this.rocketsListLength,
    super.key,});
  ///Class field for rockets list length
  final int rocketsListLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 10,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
            rocketsListLength, (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white),
                color: context.watch<PageNumberProvider>().pageNumber == index
                    ? Colors.white
                    : Colors.transparent,
              ),
              child: const SizedBox(height: 10, width: 10,),
              ),
            ),
          ),
        ),
    );
  }
}
