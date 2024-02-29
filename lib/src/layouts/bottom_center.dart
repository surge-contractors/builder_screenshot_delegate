import 'package:builder_screenshot_delegate/src/screenshot_description.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A layout that places the app at the bottom center of the screenshot.
class ScreenshotLayoutBottomCenter extends StatelessWidget {
  /// Creates a new [ScreenshotLayoutBottomCenter].
  const ScreenshotLayoutBottomCenter({
    super.key,
    required this.device,
    required this.app,
    this.title,
    this.titleAlign = TextAlign.center,
    this.titleTextStyle = const TextStyle(),
    this.subtitle,
    this.subtitleAlign = TextAlign.center,
    this.subtitleTextStyle = const TextStyle(),
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
    return ClipRRect(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ScreenshotDescription(
            title: title,
            subtitle: subtitle,
            titleTextStyle: titleTextStyle,
            subtitleTextStyle: subtitleTextStyle,
            titleAlign: titleAlign,
            subtitleAlign: subtitleAlign,
          ),
          Expanded(
            child: OverflowBox(
              alignment: Alignment.topCenter,
              maxHeight: device.screenSize.height,
              maxWidth: device.screenSize.width,
              child: DeviceFrame(
                device: device,
                screen: app,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
