import 'package:flutter/material.dart';
import 'package:jessweb/core/utils/l10n_helper.dart';
import 'package:jessweb/core/values/values.dart';
import 'package:jessweb/features/navigation/nav_data.dart';
import 'package:jessweb/features/navigation/web/nav_item.dart';

/// 行動版抽屜中的單一導覽項目,依選取狀態切換樣式。
class DrawerNavItem extends StatelessWidget {
  const DrawerNavItem({
    super.key,
    required this.item,
    required this.onTap,
  });

  final NavData item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final tr = trWithContext(context);
    return NavItem(
      onTap: onTap,
      title: tr.navLabel(item.key),
      isMobile: true,
      isSelected: item.isSelected,
      titleColor: AppColors.white,
      titleStyle: textTheme.bodyMedium?.copyWith(
        color: item.isSelected ? AppColors.primary200 : AppColors.white,
        fontSize: 16,
        fontWeight: item.isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
