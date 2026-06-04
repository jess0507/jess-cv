import 'program_skill.dart';
import 'project.dart';
import 'social_item.dart';

/// 對應 `assets/data/resume_data.json` 的頂層 model。
class ResumeData {
  final ResumeLinks links;
  final List<SocialItem> socials;
  final List<SkillData> skills;
  final List<Project> projects;

  ResumeData({
    required this.links,
    required this.socials,
    required this.skills,
    required this.projects,
  });

  factory ResumeData.fromJson(Map<String, dynamic> json) {
    return ResumeData(
      links: ResumeLinks.fromJson(json['links'] as Map<String, dynamic>),
      socials: (json['socials'] as List<dynamic>)
          .map((e) => SocialItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      skills: (json['skills'] as List<dynamic>)
          .map((e) => SkillData.fromJson(e as Map<String, dynamic>))
          .toList(),
      projects: (json['projects'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'links': links.toJson(),
        'socials': socials.map((e) => e.toJson()).toList(),
        'skills': skills.map((e) => e.toJson()).toList(),
        'projects': projects.map((e) => e.toJson()).toList(),
      };
}

/// 外部文件連結(履歷 / 作品集)。
class ResumeLinks {
  final String resumeGoogleDocs;
  final String portfolioGoogleDocs;

  ResumeLinks({
    required this.resumeGoogleDocs,
    required this.portfolioGoogleDocs,
  });

  factory ResumeLinks.fromJson(Map<String, dynamic> json) {
    return ResumeLinks(
      resumeGoogleDocs: json['resumeGoogleDocs'] as String,
      portfolioGoogleDocs: json['portfolioGoogleDocs'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'resumeGoogleDocs': resumeGoogleDocs,
        'portfolioGoogleDocs': portfolioGoogleDocs,
      };
}
