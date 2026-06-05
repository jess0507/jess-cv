import 'program_skill.dart';
import 'project.dart';
import 'social_item.dart';

/// 對應 `assets/data/resume_data.json` 的頂層 model。
class PortfolioData {
  final ShareLinks links;
  final List<SocialItem> socials;
  final List<SkillData> skills;
  final List<Project> projects;

  PortfolioData({
    required this.links,
    required this.socials,
    required this.skills,
    required this.projects,
  });

  /// 資料載入完成前使用的空狀態。
  factory PortfolioData.empty() {
    return PortfolioData(
      links: ShareLinks.empty(),
      socials: const [],
      skills: const [],
      projects: const [],
    );
  }

  factory PortfolioData.fromJson(Map<String, dynamic> json) {
    return PortfolioData(
      links: ShareLinks.fromJson(json['links'] as Map<String, dynamic>),
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
class ShareLinks {
  final String resumeGoogleDocs;
  final String portfolioGoogleDocs;

  ShareLinks({
    required this.resumeGoogleDocs,
    required this.portfolioGoogleDocs,
  });

  factory ShareLinks.empty() {
    return ShareLinks(
      resumeGoogleDocs: '',
      portfolioGoogleDocs: '',
    );
  }

  factory ShareLinks.fromJson(Map<String, dynamic> json) {
    return ShareLinks(
      resumeGoogleDocs: json['resumeGoogleDocs'] as String,
      portfolioGoogleDocs: json['portfolioGoogleDocs'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'resumeGoogleDocs': resumeGoogleDocs,
        'portfolioGoogleDocs': portfolioGoogleDocs,
      };
}
