import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'custom_check_icon.dart';
import 'dashed_line.dart';
import 'thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(clipBehavior: Clip.none, children: [
        const ThankYouCard(),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * 0.2 + 20,
          left: 0,
          right: 0,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: DashedLineSeperater(),
          ),
        ),
        Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            )),
        Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            )),
        const Positioned(
          left: 0,
          right: 0,
          top: -50,
          child: CustomCheckIcon(),
        )
      ]),
    );
  }
}
