import 'package:flutter/widgets.dart';

import '../../../../../core/utils/styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, this.onTap, required this.title});
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF34A853),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.style20,
        )),
      ),
    );
  }
}
