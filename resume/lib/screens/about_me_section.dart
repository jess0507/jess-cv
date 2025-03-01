import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:resume/values/values.dart';
import 'package:resume/widgets/spaces.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(StringConst.INTRO,
                  speed: Duration(milliseconds: 60),
                  textStyle: textTheme.headlineMedium),
            ],
            onTap: () {},
            isRepeatingAnimation: true,
            totalRepeatCount: 5,
          ),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                StringConst.POSITION,
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
          SpaceH16(),
          SelectableText(
            StringConst.ABOUT_DEV,
            style: textTheme.bodyMedium?.copyWith(fontSize: Sizes.TEXT_SIZE_16),
          )
        ],
      ),
    );
  }
}
