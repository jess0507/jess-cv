import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../core/widgets/spaces.dart';
import '../../data/constants.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  static final path = 'skill';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    List<Widget> buildSkillSection() {
      return programSkillList.map(
        (data) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.category,
                style: textTheme.titleMedium,
              ),
              SpaceH8(),
              ...data.list.map(
                (info) {
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
                },
              ),
            ],
          );
        },
      ).toList();
    }

    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      alignment: WrapAlignment.start,
      children: <Widget>[
        ...buildSkillSection().map(
          (e) => Container(
            padding: EdgeInsets.only(bottom: 20),
            width: 250,
            child: e,
          ),
        ),
      ],
    );
  }
}
