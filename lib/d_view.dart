library d_view;

import 'package:flutter/material.dart';

/// Widget for helping response and utility in Flutter
class DView {
  static PreferredSizeWidget appBarLeft(String title) {
    return AppBar(
      title: Text(title),
      titleSpacing: 0,
    );
  }

  static PreferredSizeWidget appBarCenter(String title) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }

  static Widget spaceHeight([double size = 16]) {
    return SizedBox(height: size);
  }

  static Widget spaceWidth([double? size]) {
    return SizedBox(width: size ?? 16);
  }

  static Widget empty([String? data]) {
    return Center(child: Text(data ?? 'Belum ada data'));
  }

  static Widget loadingCircle() {
    return const Center(child: CircularProgressIndicator());
  }

  static Widget loadingBar() {
    return const Center(child: LinearProgressIndicator());
  }

  static Widget error([String? data]) {
    return Center(child: Text(data ?? 'Terjadi kesalahan'));
  }

  static Widget textTitle(String text,
      {double? size, Color? color, FontWeight? weight}) {
    return Builder(builder: (context) {
      return Text(
        text,
        style: TextStyle(
          fontSize: size ?? 18,
          fontWeight: weight ?? FontWeight.bold,
          color: color ?? Theme.of(context).primaryColor,
        ),
      );
    });
  }

  static Widget textAction(
    Function onTap,
    String text, {
    TextStyle? customStyle,
    double? size,
    FontWeight? weight,
    Color? color,
    IconData? iconRight,
    Color? iconRightColor,
    double? iconRightSize,
    Widget? customIconRight,
  }) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () => onTap(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: customStyle ??
                  TextStyle(
                    fontWeight: weight ?? FontWeight.bold,
                    fontSize: size ?? 16,
                    color: color ?? Theme.of(context).primaryColor,
                  ),
            ),
            if (customIconRight != null) customIconRight,
            if (customIconRight == null)
              iconRight == null
                  ? const SizedBox()
                  : Icon(
                      iconRight,
                      color: iconRightColor ?? Theme.of(context).primaryColor,
                      size: iconRightSize,
                    ),
          ],
        ),
      );
    });
  }
}
