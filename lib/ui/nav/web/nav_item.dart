import 'package:flutter/material.dart';
import 'package:resume/core/values/values.dart';
import 'package:resume/ui/nav/web/selected_indicator.dart';

import 'animated_indicator.dart';

class NavItem extends StatefulWidget {
  const NavItem({
    super.key,
    this.width = 120,
    required this.title,
    this.titleColor = AppColors.black,
    this.isSelected = false,
    this.isMobile = false,
    this.titleStyle,
    this.onTap,
  });

  final double width;
  final String title;
  final TextStyle? titleStyle;
  final Color titleColor;
  final bool isSelected;
  final bool isMobile;
  final GestureTapCallback? onTap;

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> with SingleTickerProviderStateMixin {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          alignment: Alignment.center,
          width: widget.width,
          child: Stack(
            children: [
              if (!widget.isMobile)
                widget.isSelected
                    ? Positioned(
                        top: 12,
                        child: SelectedIndicator(
                          width: widget.width,
                        ),
                      )
                    : Positioned(
                        top: 12,
                        child: AnimatedHoverIndicator(
                          isHover: _hovering,
                          width: widget.width,
                        ),
                      ),
              Text(
                widget.title,
                style: widget.titleStyle ?? textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }
}
