import 'package:flutter/material.dart';
import 'widgets/build_appbar.dart';

import 'widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppbar(),
      body: Transform.translate(
          offset: const Offset(0, -16), child: const ThankYouViewBody()),
    );
  }
}
