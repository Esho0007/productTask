import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScalffold;
  final Widget tabletScalffold;
  final Widget desktopScalffold;

  const ResponsiveLayout(
      {Key? key,
      required this.mobileScalffold,
      required this.tabletScalffold,
      required this.desktopScalffold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobileScalffold;
        } else if (constraints.maxWidth < 1100) {
          return tabletScalffold;
        } else {
          return desktopScalffold;
        }
      },
    );
  }
}
