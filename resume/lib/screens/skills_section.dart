import 'package:flutter/material.dart';
import 'package:resume/data/data.dart';
import 'package:resume/data/model/data_section.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    Widget buildSkillSection(DataSection skillSection) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...skillSection.list.map((info) {
            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      info.title,
                      style: textTheme.bodyMedium,
                    ),
                    if (info.extra != null)
                      Text(
                        ' - ${info.extra}',
                        style: textTheme.bodyMedium,
                      )
                  ],
                ),
                SizedBox(height: 8),
              ],
            );
          }),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...toolSectionList.map(
          (section) {
            return Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      section.title,
                      style: textTheme.titleMedium,
                    ),
                    SizedBox(height: 8),
                    buildSkillSection(section),
                  ],
                ));
          },
        ),
        Spacer(),
      ],
    );
  }
}
