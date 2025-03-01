import 'package:flutter/material.dart';
import 'package:resume/data/data.dart';
import 'package:resume/values/values.dart';
import 'package:resume/widgets/spaces.dart';

class CareerSection extends StatelessWidget {
  const CareerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: careerSectionList.length,
      itemBuilder: (context, index) {
        final jobInfo = careerSectionList[index];

        return Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      jobInfo.companyName,
                      style: textTheme.headlineMedium?.copyWith(
                          fontSize: Sizes.TEXT_SIZE_18,
                          color: AppColors.black400),
                    ),
                    SpaceH4(),
                    Text(
                      jobInfo.position,
                      style: textTheme.titleSmall?.copyWith(
                        color: AppColors.grey500,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                jobInfo.time,
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
