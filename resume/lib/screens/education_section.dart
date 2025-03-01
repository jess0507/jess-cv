import 'package:flutter/material.dart';
import 'package:resume/data/data.dart';
import 'package:resume/data/model/education.dart';
import 'package:resume/utils/functions.dart';
import 'package:resume/values/values.dart';
import 'package:resume/widgets/spaces.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    Widget buildEducationInfoList(List<Education> list) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final info = list[index];

          return Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        info.school,
                        style: textTheme.headlineMedium?.copyWith(
                          fontSize: Sizes.TEXT_SIZE_20,
                          color: AppColors.black400,
                        ),
                      ),
                      SpaceH4(),
                      Text(
                        info.degree,
                        style: textTheme.titleSmall?.copyWith(
                          color: AppColors.grey500,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      SpaceH4(),
                      GestureDetector(
                        onTap: () {
                          openUrlLink(info.thesisUrl);
                        },
                        child: Text(
                          info.thesis,
                          style: textTheme.labelLarge?.copyWith(
                            color: AppColors.primary300,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primary300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  info.time,
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildEducationInfoList(educationInfoList),
      ],
    );
  }
}
