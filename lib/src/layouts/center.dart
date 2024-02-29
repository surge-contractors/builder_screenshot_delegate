import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A layout that places the app at the center of the screenshot.
class ScreenshotLayoutCenter extends StatelessWidget {
  /// Creates a new [ScreenshotLayoutCenter].
  const ScreenshotLayoutCenter({
    required this.device,
    required this.app,
    super.key,
    this.title,
    this.titleTextStyle = const TextStyle(),
    this.subtitle,
    this.subtitleTextStyle = const TextStyle(),
    this.titleAlign = TextAlign.center,
    this.subtitleAlign = TextAlign.center,
  });

  /// The app to display in the screenshot.
  final Widget app;

  /// The device to display the app on.
  final DeviceInfo device;

  /// The title to display.
  final String? title;

  /// The subtitle to display.
  final String? subtitle;

  /// The style to use for the title.
  final TextStyle titleTextStyle;

  /// The style to use for the subtitle.
  final TextStyle subtitleTextStyle;

  /// The alignment to use for the title.
  final TextAlign titleAlign;

  /// The alignment to use for the subtitle.
  final TextAlign subtitleAlign;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DeviceFrame(
          device: device,
          screen: app,
        ),
      ),
    );
  }
}
