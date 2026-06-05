import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:jessweb/core/utils/l10n_helper.dart';
import 'package:jessweb/core/values/values.dart';

/// 首頁開場的打字機動畫(自我介紹 + 職稱)。
class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final tr = trWithContext(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextKit(
          key: ValueKey(tr.intro),
          animatedTexts: [
            TypewriterAnimatedText(tr.intro,
                speed: Duration(milliseconds: 60),
                textStyle: textTheme.headlineMedium),
          ],
          onTap: () {},
          isRepeatingAnimation: true,
          totalRepeatCount: 5,
        ),
        AnimatedTextKit(
          key: ValueKey(tr.position),
          animatedTexts: [
            TypewriterAnimatedText(
              tr.position,
              speed: Duration(milliseconds: 80),
              textStyle: textTheme.headlineMedium?.copyWith(
                color: AppColors.primaryColor,
                height: 1.2,
              ),
            ),
          ],
          onTap: () {},
          isRepeatingAnimation: true,
          totalRepeatCount: 5,
        ),
      ],
    );
  }
}
