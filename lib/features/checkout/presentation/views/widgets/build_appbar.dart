  import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

AppBar BuildAppbar({ final String? title}) {
    return AppBar(
        leading: const Icon(Icons.arrow_back_outlined,
            size: 35, color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title:  Text(
          title??"",
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),
      );
  }

