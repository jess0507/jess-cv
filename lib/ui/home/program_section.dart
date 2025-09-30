import 'package:flutter/material.dart';
import 'package:resume/data/model/program_skill.dart';

import '../../data/constants.dart';

class ProgramSection extends StatelessWidget {
  const ProgramSection({super.key});

  static final path = 'program';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    Widget buildSkillSection(SkillData skillSection) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...skillSection.list.map((info) {
            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      info,
                      style: textTheme.bodyMedium,
                    ),
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
        ...programSkillList.map((section) {
          return Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    section.category,
                    style: textTheme.titleMedium,
                  ),
                  SizedBox(height: 8),
                  buildSkillSection(section),
                ],
              ));
        }),
      ],
    );
  }
}
