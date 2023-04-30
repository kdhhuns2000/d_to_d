import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  const ResponsiveLayout({
    super.key,
    required this.desktopBody,
    required this.mobileBody,
    required this.tabletBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return mobileBody;
        } else if (constraints.maxWidth > 600 && constraints.maxWidth <= 900) {
          return tabletBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
