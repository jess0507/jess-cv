import 'package:flutter/material.dart';
import 'package:resume/values/values.dart';
import 'package:resume/widgets/spaces.dart';

class NavSectionMobile extends StatelessWidget {
  final bool isDrawerOpen;
  final Function() openDrawer;
  final Function() openEndDrawer;

  const NavSectionMobile({
    super.key,
    required this.isDrawerOpen,
    required this.openDrawer,
    required this.openEndDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.HEIGHT_100,
      child: Row(
        children: [
          SpaceW30(),
          IconButton(
            icon: Icon(
              Icons.menu,
              color: AppColors.black100,
              size: Sizes.ICON_SIZE_26,
            ),
            onPressed: () {
              if (isDrawerOpen == true) {
                openEndDrawer();
              } else {
                openDrawer();
              }
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}
