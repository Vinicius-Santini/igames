import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

Widget sectionError() => SizedBox(
      height: 225.0,
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            Text(
              "Sorry",
              style: titleStyle,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "We couldn't load this section",
              style: subTitleStyle,
            )
          ],
        ),
      ),
    );
