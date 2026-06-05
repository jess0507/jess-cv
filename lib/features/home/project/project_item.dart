import 'package:flutter/material.dart';
import 'package:jessweb/core/values/values.dart';
import 'package:jessweb/features/home/project/project_cover.dart';

class ProjectItem extends StatefulWidget {
  const ProjectItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.bannerHeight,
    this.titleStyle,
    this.subtitleStyle,
    this.textColor = AppColors.white,
    this.bannerColor,
  });

  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final String imageUrl;
  final Color? bannerColor;
  final Color textColor;
  final double width;
  final double height;
  final double? bannerHeight;

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem>
    with TickerProviderStateMixin {
  late AnimationController _slideFadeController;
  late AnimationController _indicatorController;
  late Animation<double> _indicatorAnimation;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;
  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    _indicatorController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideFadeController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _indicatorAnimation = Tween(
      begin: 100.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _indicatorController,
        curve: Curves.easeIn,
      ),
    );
    _fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _slideFadeController,
        curve: Curves.easeIn,
      ),
    );
    _slideAnimation =
        Tween<Offset>(begin: Offset(0, -0.1), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: _slideFadeController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _slideFadeController.dispose();
    _indicatorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: Container(
        child: Stack(
          children: [
            Container(
              width: widget.width,
              height: widget.height,
              color: AppColors.grey100,
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
            Positioned(
              bottom: 0,
              child: FadeTransition(
                opacity: _fadeInAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: ProjectCover(
                    animation: _indicatorAnimation,
                    color: widget.bannerColor ?? Colors.black.withOpacity(0.8),
                    width: widget.width,
                    height: widget.bannerHeight ?? widget.height / 3,
                    title: widget.title,
                    subtitle: widget.subtitle,
                    titleStyle: widget.titleStyle,
                    subtitleStyle: widget.subtitleStyle,
                    isHover: _hovering,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
    if (_hovering) {
      _slideFadeController.forward();
      _indicatorController.forward();
    } else {
      _slideFadeController.reverse();
      _indicatorController.reset();
    }
  }
}
