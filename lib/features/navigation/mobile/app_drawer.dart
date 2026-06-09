import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jessweb/core/values/values.dart';
import 'package:jessweb/features/locale/locale_selector.dart';
import 'package:jessweb/features/navigation/mobile/drawer_footer.dart';
import 'package:jessweb/features/navigation/mobile/drawer_nav_item.dart';
import 'package:jessweb/features/navigation/nav_data.dart';
import 'package:jessweb/features/navigation/scaffold_with_nav.dart';

class AppDrawer extends ConsumerStatefulWidget {
  final Color color;
  final double? width;
  final List<NavData> navItems;
  final GestureTapCallback? onClose;
  final OnTapNavItem onTapNavItem;

  const AppDrawer({
    super.key,
    this.color = AppColors.black100,
    this.width,
    required this.navItems,
    this.onClose,
    required this.onTapNavItem,
  });

  @override
  ConsumerState<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends ConsumerState<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Container(
        color: widget.color,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Spacer(),
                InkWell(
                  onTap: widget.onClose ?? () => _closeDrawer(),
                  child: Icon(
                    Icons.close,
                    size: 30,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.navItems.length + 1,
                itemBuilder: (context, index) {
                  if (index == widget.navItems.length) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: LocaleSelector(color: AppColors.white),
                      ),
                    );
                  }
                  final item = widget.navItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: DrawerNavItem(
                      item: item,
                      onTap: () => widget.onTapNavItem(item),
                    ),
                  );
                },
              ),
            ),
            DrawerFooter(buttonColor: widget.color),
          ],
        ),
      ),
    );
  }

  _closeDrawer() {
    Navigator.pop(context);
  }
}
