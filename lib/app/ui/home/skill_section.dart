import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resume/app/core/widgets/spaces.dart';
import 'package:resume/app/providers/resume_provider.dart';

class SkillSection extends ConsumerWidget {
  const SkillSection({super.key});

  static final path = 'skill';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final skills = ref.watch(resumeDataProvider).skills;

    List<Widget> buildSkillSection() {
      return skills.map(
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
      runSpacing: 5.0,
      alignment: WrapAlignment.start,
      children: <Widget>[
        ...buildSkillSection().map(
          (e) => Container(
            padding: EdgeInsets.only(bottom: 20),
            width: 200,
            child: e,
          ),
        ),
      ],
    );
  }
}
