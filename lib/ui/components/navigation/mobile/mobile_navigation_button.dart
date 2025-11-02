import 'package:flutter/material.dart';
import 'package:resume/core/values/values.dart';
import 'package:resume/core/widgets/spaces.dart';
import 'package:resume/data/locale_service.dart';

class MobileNavigationbutton extends StatelessWidget {
  final Function() onTapDrawer;

  const MobileNavigationbutton({
    super.key,
    required this.onTapDrawer,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 60,
      child: Row(
        children: [
          SpaceW20(),
          InkWell(
            onTap: () {},
            child: Text(
              LocaleService().getText("logo"),
              style: textTheme.headlineMedium,
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.menu,
              color: AppColors.black100,
              size: 26,
            ),
            onPressed: () {
              onTapDrawer();
            },
          ),
          SpaceW20(),
        ],
      ),
    );
  }
}
