import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume/data/data.dart';
import 'package:resume/data/model/data_section.dart';
import 'package:resume/data/model/program_skill.dart';
import 'package:resume/utils/adaptive.dart';
import 'package:resume/widgets/spaces.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    List<Widget> buildSkillSection(DataSection skillSection) {
      return skillSection.list.map((info) {
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
      }).toList();
    }

    Widget buildProgramSkillSection(ProgramSkill skillSection) {
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
                SpaceH8(),
              ],
            );
          }),
        ],
      );
    }

    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        final maxWidth = sizingInformation.screenSize.width <
                RefinedBreakpoints().desktopSmall
            ? assignWidth(context, 1.0)
            : assignWidth(context, 0.19);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              children: [
                ...toolSectionList.map(
                  (skillSection) {
                    return SizedBox(
                      width: maxWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            skillSection.title,
                            style: textTheme.titleMedium,
                          ),
                          SizedBox(height: 8),
                          ...buildSkillSection(skillSection),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            SpaceH24(),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              children: [
                ...programSkillList.map(
                  (skillSection) {
                    return SizedBox(
                      width: maxWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            skillSection.category,
                            style: textTheme.titleMedium,
                          ),
                          SpaceH8(),
                          buildProgramSkillSection(skillSection),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
