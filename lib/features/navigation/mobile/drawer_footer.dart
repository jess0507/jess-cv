import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jessweb/core/utils/l10n_helper.dart';
import 'package:jessweb/core/values/values.dart';
import 'package:jessweb/core/widgets/social_icons_row.dart';
import 'package:jessweb/core/widgets/spaces.dart';
import 'package:jessweb/data/providers/portfolio_provider.dart';

/// 行動版抽屜底部:社群圖示與「Made in Taiwan」署名。
class DrawerFooter extends ConsumerWidget {
  const DrawerFooter({
    super.key,
    this.buttonColor = AppColors.black100,
  });

  final Color buttonColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = trWithContext(context);
    final socialData =
        ref.watch(portfolioProvider).valueOrNull?.socials ?? const [];
    final textTheme = Theme.of(context).textTheme;
    final footerTextStyle = textTheme.bodyMedium?.copyWith(
      color: AppColors.primaryText2,
      fontWeight: FontWeight.bold,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpaceH4(),
        SocialIconsRow(
          socials: socialData,
          source: 'mobile_drawer',
          buttonColor: buttonColor,
          iconColor: Colors.white,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        SpaceH12(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: tr.buildBy,
                style: footerTextStyle,
                children: [
                  TextSpan(
                    text: tr.jessYen,
                    style: footerTextStyle?.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SpaceH4(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(tr.madeIn, style: footerTextStyle),
            SpaceW4(),
            ClipRRect(
              borderRadius: BorderRadius.all(const Radius.circular(20)),
              child: Text('🇹🇼'),
            ),
            SpaceW4(),
            Text(tr.withText, style: footerTextStyle),
            SpaceW4(),
            Icon(
              FontAwesomeIcons.solidHeart,
              color: AppColors.red,
              size: 12,
            ),
          ],
        ),
      ],
    );
  }
}
