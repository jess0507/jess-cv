import 'package:flutter/material.dart';
import 'package:resume/core/values/values.dart';

class SocialButtonData {
  final String tag;
  final String url;
  final IconData iconData;
  final Color? iconColor;
  final Color? borderColor;

  SocialButtonData({
    required this.tag,
    required this.iconData,
    required this.url,
    this.iconColor,
    this.borderColor,
  });
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.tag,
    required this.iconData,
    this.onPressed,
    this.width = 28,
    this.height = 28,
    this.elevation = 1,
    this.buttonColor = AppColors.white,
    this.iconColor = AppColors.black,
    this.iconSize = 14,
    this.decoration,
  });

  final String tag;
  final double width;
  final double elevation;
  final double height;
  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final Color buttonColor;
  final BoxDecoration? decoration;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: FloatingActionButton(
        elevation: elevation,
        onPressed: onPressed,
        backgroundColor: buttonColor,
        heroTag: tag,
        child: Tooltip(
          message: tag,
          child: Icon(
            iconData,
            size: iconSize,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
