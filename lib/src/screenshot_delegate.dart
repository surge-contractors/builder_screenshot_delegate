import 'package:builder_flutter_factories/builder_flutter_factories.dart';
import 'package:builder_models/builder_models_with_flutter_internals.dart'
    as builder;
import 'package:builder_screenshot_delegate/src/layouts/layouts.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

/// A delegate that takes a screenshot of a device with a given configuration.
class ScreenshotDelegate extends StatelessWidget {
  /// Creates a new [ScreenshotDelegate].
  const ScreenshotDelegate({
    required this.device,
    required this.configuration,
    super.key,
    this.app = const SizedBox.shrink(),
  });

  /// The configuration of the screenshot.
  final builder.ScreenshotConfiguration configuration;

  /// The device to take the screenshot of.
  final DeviceInfo device;

  /// The app to take the screenshot of.
  final Widget app;

  String get title => configuration.title;
  TextStyle get titleTextStyle => TextStyleFactory.fromBuilderModels(
        configuration.titleStyle,
      );

  TextAlign get titleAlign =>
      TextAlignFactory.fromBuilderModels(configuration.titleAlign);
  String get subtitle => configuration.subtitle;
  TextStyle get subtitleTextStyle => TextStyleFactory.fromBuilderModels(
        configuration.subtitleStyle,
      );
  TextAlign get subtitleAlign =>
      TextAlignFactory.fromBuilderModels(configuration.subtitleAlign);

  Widget get foreground {
    if (configuration.deviceLocation == builder.Alignment.topCenter) {
      return ScreenshotLayoutTopCenter(
        app: app,
        device: device,
        title: title,
        subtitle: subtitle,
        titleTextStyle: titleTextStyle,
        subtitleTextStyle: subtitleTextStyle,
        titleAlign: titleAlign,
        subtitleAlign: subtitleAlign,
      );
    }

    if (configuration.deviceLocation == builder.Alignment.bottomCenter) {
      return ScreenshotLayoutBottomCenter(
        app: app,
        device: device,
        title: title,
        subtitle: subtitle,
        titleTextStyle: titleTextStyle,
        subtitleTextStyle: subtitleTextStyle,
        titleAlign: titleAlign,
        subtitleAlign: subtitleAlign,
      );
    }

    if (configuration.deviceLocation == builder.Alignment.bottomRight) {
      return ScreenshotLayoutBottomRight(
        app: app,
        device: device,
        title: title,
        subtitle: subtitle,
        titleTextStyle: titleTextStyle,
        subtitleTextStyle: subtitleTextStyle,
        titleAlign: titleAlign,
        subtitleAlign: subtitleAlign,
      );
    }

    if (configuration.deviceLocation == builder.Alignment.bottomLeft) {
      return ScreenshotLayoutBottomLeft(
        app: app,
        device: device,
        title: title,
        subtitle: subtitle,
        titleTextStyle: titleTextStyle,
        subtitleTextStyle: subtitleTextStyle,
        titleAlign: titleAlign,
        subtitleAlign: subtitleAlign,
      );
    }

    if (configuration.deviceLocation == builder.Alignment.topLeft) {
      return ScreenshotLayoutTopLeft(
        app: app,
        device: device,
        title: title,
        subtitle: subtitle,
        titleTextStyle: titleTextStyle,
        subtitleTextStyle: subtitleTextStyle,
        titleAlign: titleAlign,
        subtitleAlign: subtitleAlign,
      );
    }

    if (configuration.deviceLocation == builder.Alignment.topRight) {
      return ScreenshotLayoutTopRight(
        app: app,
        device: device,
        title: title,
        subtitle: subtitle,
        titleTextStyle: titleTextStyle,
        subtitleTextStyle: subtitleTextStyle,
        titleAlign: titleAlign,
        subtitleAlign: subtitleAlign,
      );
    }

    if (configuration.deviceLocation == builder.Alignment.center) {
      return ScreenshotLayoutCenter(
        app: app,
        device: device,
        title: title,
        subtitle: subtitle,
        titleTextStyle: titleTextStyle,
        subtitleTextStyle: subtitleTextStyle,
        titleAlign: titleAlign,
        subtitleAlign: subtitleAlign,
      );
    }

    if (configuration.deviceLocation == builder.Alignment.centerRight) {
      return ScreenshotLayoutCenterRight(
        app: app,
        device: device,
        title: title,
        subtitle: subtitle,
        titleTextStyle: titleTextStyle,
        subtitleTextStyle: subtitleTextStyle,
        titleAlign: titleAlign,
        subtitleAlign: subtitleAlign,
      );
    }

    if (configuration.deviceLocation == builder.Alignment.centerLeft) {
      return ScreenshotLayoutCenterLeft(
        app: app,
        device: device,
        title: title,
        subtitle: subtitle,
        titleTextStyle: titleTextStyle,
        subtitleTextStyle: subtitleTextStyle,
        titleAlign: titleAlign,
        subtitleAlign: subtitleAlign,
      );
    }

    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: device.mediaQueryData,
      child: SizedBox.fromSize(
        size: device.screenSize,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: ColorFactory.fromBuilderModels(
              configuration.backgroundColor,
            ),
          ),
          child: foreground,
        ),
      ),
    );
  }
}

extension MediaQueryDevice on DeviceInfo {
  MediaQueryData get mediaQueryData {
    return MediaQueryData(
      size: screenSize,
      devicePixelRatio: pixelRatio,
      textScaleFactor: 1.0,
      platformBrightness: Brightness.light,
      padding: EdgeInsets.zero,
      viewPadding: EdgeInsets.zero,
      viewInsets: EdgeInsets.zero,
      alwaysUse24HourFormat: false,
      accessibleNavigation: false,
      invertColors: false,
      highContrast: false,
      disableAnimations: false,
      boldText: false,
    );
  }
}
