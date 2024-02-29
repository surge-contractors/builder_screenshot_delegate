import 'package:builder_screenshot_delegate/src/screenshot_description.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A layout that places the app at the top left of the screenshot.
class ScreenshotLayoutTopLeft extends StatelessWidget {
  /// Creates a new [ScreenshotLayoutTopLeft].
  const ScreenshotLayoutTopLeft({
    required this.app,
    required this.device,
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
    return ClipRRect(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: OverflowBox(
              alignment: Alignment.bottomCenter,
              maxHeight: device.screenSize.height,
              maxWidth: device.screenSize.width,
              child: Transform.translate(
                offset: Offset(-1 * device.screenSize.width / 2, 0),
                child: DeviceFrame(
                  device: device,
                  screen: app,
                ),
              ),
            ),
          ),
          ScreenshotDescription(
            title: title,
            subtitle: subtitle,
            titleTextStyle: titleTextStyle,
            subtitleTextStyle: subtitleTextStyle,
            titleAlign: titleAlign,
            subtitleAlign: subtitleAlign,
          ),
        ],
      ),
    );
  }
}
