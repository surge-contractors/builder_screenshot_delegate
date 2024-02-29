import 'package:flutter/material.dart';

/// A widget that displays a title and subtitle.
class ScreenshotDescription extends StatelessWidget {
  /// Creates a new [ScreenshotDescription].
  const ScreenshotDescription({
    super.key,
    this.title,
    this.subtitle,
    this.titleTextStyle = const TextStyle(inherit: false),
    this.subtitleTextStyle = const TextStyle(inherit: false),
    this.titleAlign = TextAlign.center,
    this.subtitleAlign = TextAlign.center,
  });

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          if (title != null || subtitle != null) const SizedBox(height: 16),
          if (title != null)
            Row(
              children: [
                Expanded(
                  child: Text(
                    title!,
                    style: titleTextStyle,
                    textAlign: titleAlign,
                  ),
                ),
              ],
            ),
          if (title != null && subtitle != null) const SizedBox(height: 8),
          if (subtitle != null)
            Row(
              children: [
                Expanded(
                  child: Text(
                    subtitle!,
                    style: subtitleTextStyle,
                    textAlign: subtitleAlign,
                  ),
                ),
              ],
            ),
          if (title != null || subtitle != null) const SizedBox(height: 16),
        ],
      ),
    );
  }
}
