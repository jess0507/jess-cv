import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume/core/utils/functions.dart';
import 'package:resume/ui/project/project_item.dart';

import '../../data/constants.dart';
import '../home/home_page.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});
  static const path = '/project';

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth =
            sizingInformation.screenSize.width * (1 - webScreenRatioForPadding);
        final isMobile = screenWidth < RefinedBreakpoints().tabletLarge;
        final width = isMobile ? 400.0 : 350.0;
        final height = isMobile ? 300.0 : 250.0;

        return Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          alignment: WrapAlignment.start,
          children: <Widget>[
            ...projects.map(
              (project) => Column(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.only(right: 20, bottom: 40),
                    child: InkWell(
                      onTap: () async {
                        await openUrlLink(project.link);
                      },
                      child: ProjectItem(
                        title: project.title,
                        subtitle: project.subtitle,
                        imageUrl: project.imageUrl,
                        width: width,
                        height: height,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
