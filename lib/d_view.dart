library d_view;

import 'package:flutter/material.dart';

/// Widget for helping response and utility in Flutter
class DView {
  /// default size for space\
  /// 16.0\
  ///
  /// Effect:
  /// - height()
  /// - width()
  static double defaultSpace = 16.0;

  ///SimpleAppBar with left title
  static PreferredSizeWidget appBarLeft(String title) {
    return AppBar(
      title: Text(title),
      titleSpacing: 0,
    );
  }

  ///SimpleAppBar with center title
  static PreferredSizeWidget appBarCenter(String title) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }

  @Deprecated('Please use DView.height()')

  /// space like sizedbox for height, default 16
  static Widget spaceHeight([double size = 16]) {
    return SizedBox(height: size);
  }

  @Deprecated('Please use DView.width()')

  /// space like sizedbox for width, default 16
  static Widget spaceWidth([double size = 16]) {
    return SizedBox(width: size);
  }

  /// space like sizedbox for height,\
  /// default: `DView.defaultSpace`
  static Widget height([double? size]) {
    double sizeX = size ?? defaultSpace;
    return SizedBox(
      height: sizeX.isNegative ? 0 : sizeX,
    );
  }

  /// space like sizedbox for width,\
  /// default: `DView.defaultSpace`
  static Widget width([double? size]) {
    double sizeX = size ?? defaultSpace;
    return SizedBox(
      width: sizeX.isNegative ? 0 : sizeX,
    );
  }

  /// response for empty data
  static Widget empty([String data = "There's no data"]) {
    return Center(child: Text(data));
  }

  /// response for nothing widget
  /// usually used for checking like visibility off
  static Widget nothing() => const SizedBox();

  /// response for loading circle, default align t center
  static Widget loadingCircle() {
    return const Center(child: CircularProgressIndicator());
  }

  /// response for loading linear, default align t center
  static Widget loadingBar() {
    return const Center(child: LinearProgressIndicator());
  }

  /// response for error
  static Widget error({
    String data = 'Something went wrong',
    TextStyle? style,
  }) {
    return Center(child: Text(data, style: style));
  }

  /// text for title content
  static Widget textTitle(
    String text, {
    double? size,
    Color? color,
    FontWeight? weight,
  }) {
    return Builder(builder: (context) {
      return Text(
        text,
        style: TextStyle(
          fontSize: size ?? 18,
          fontWeight: weight ?? FontWeight.bold,
          color: color ?? Theme.of(context).colorScheme.onBackground,
        ),
      );
    });
  }

  /// text for action
  static Widget textAction(
    void Function() onTap, {
    String text = 'See All',
    TextStyle? customStyle,
    double size = 16,
    FontWeight weight = FontWeight.bold,
    Color color = Colors.black,
    IconData? iconRight,
    Color iconRightColor = Colors.black,
    double? iconRightSize,
    Widget? customIconRight,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: customStyle ??
                TextStyle(
                  fontWeight: weight,
                  fontSize: size,
                  color: color,
                ),
          ),
          if (customIconRight != null)
            customIconRight
          else
            iconRight == null
                ? const SizedBox()
                : Icon(
                    iconRight,
                    color: iconRightColor,
                    size: iconRightSize,
                  ),
        ],
      ),
    );
  }
}
