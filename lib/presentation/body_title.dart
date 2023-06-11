import 'package:flutter/material.dart';

///Title widget
class BodyTitleWidget extends StatelessWidget {
  ///Constructor
  const BodyTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 25, bottom: 16),
      padding: const EdgeInsets.only(left: 15),
      child: const Text('Missions',
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
