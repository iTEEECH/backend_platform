import 'package:flutter/material.dart';

class CustomResponsiveLayoutBuilder extends StatelessWidget {
  /// [desktop] defines a screen width greater than 1280.0 pixels.
  final WidgetBuilder desktop;

  /// [tablet] defines a screen width between 600.0 and 1280.0 pixels.
  final WidgetBuilder? tablet;

  /// [mobile] defines a screen width of less than 780.0 pixels.
  final WidgetBuilder? mobile;

  const CustomResponsiveLayoutBuilder({
    super.key,
    required this.desktop,
    this.tablet,
    this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return switch (constraints.maxWidth) {
          > 1280.0 => desktop(context),
          >= 780.0 => !(tablet == null) ? tablet!(context) : desktop(context),
          _ => !(mobile == null) ? mobile!(context) : desktop(context),
        };
      },
    );
  }
}
