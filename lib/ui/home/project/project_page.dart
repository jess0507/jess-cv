import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume/core/utils/functions.dart';
import 'package:resume/data/constants.dart';
import 'package:resume/data/analytics_service.dart';
import 'package:resume/ui/home/project/project_item.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});
  static const path = '/project';

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        final isMobile = screenWidth < RefinedBreakpoints().tabletLarge;
        final width = isMobile ? 500.0 : 350.0;
        final height = isMobile ? 250.0 : 250.0;

        return isMobile
            ? Column(
                children: [
                  ...projects.map(
                    (project) => Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 40),
                          child: InkWell(
                            onTap: () async {
                              AnalyticsService().logEvent(
                                name: 'project_clicked',
                                parameters: {
                                  'project_title': project.title,
                                  'project_link': project.link,
                                },
                              );
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
              )
            : Wrap(
                spacing: 30.0,
                runSpacing: 4.0,
                alignment: WrapAlignment.spaceEvenly,
                children: <Widget>[
                  ...projects.map(
                    (project) => Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            AnalyticsService().logEvent(
                              name: 'project_clicked',
                              parameters: {
                                'project_title': project.title,
                                'project_link': project.link,
                              },
                            );
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
                      ],
                    ),
                  ),
                ],
              );
      },
    );
  }
}
