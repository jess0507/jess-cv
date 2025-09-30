import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/data/model/program_skill.dart';
import 'package:resume/core/widgets/social_button.dart';

import 'model/project.dart';

const resumeGoogleGocsLink =
    'https://docs.google.com/document/d/1Bg5g0cCDWD2LYTocORKdNk08o4QtcGPit8YCrfIq-Pk/edit?usp=sharing';
const portfolioGoogleGocsLink =
    'https://docs.google.com/document/d/19IprPTxV_yZEW55SL0ugd0Nfm92q6GU0v1AkIcviebg/edit?usp=sharing';

final List<SocialButtonData> socialData = [
  SocialButtonData(
    tag: 'merukoo0507@gmail.com',
    iconData: FontAwesomeIcons.envelope,
    url: 'mailto:merukoo0507@gmail.com',
  ),
  SocialButtonData(
    tag: 'peishan-y-330411182',
    iconData: FontAwesomeIcons.linkedin,
    url: 'https://www.linkedin.com/in/peishan-y-330411182/',
  ),
  SocialButtonData(
    tag: 'jess0507',
    iconData: FontAwesomeIcons.github,
    url: 'https://github.com/jess0507',
  ),
];

final programSkillList = [
  SkillData(
    category: 'Language',
    list: [
      'Chinese (Mother language)',
      'English (Second language)',
    ],
  ),
  SkillData(
    category: 'Program',
    list: ['Kotlin', 'Dart', 'Java', 'Typescript'],
  ),
  SkillData(
    category: 'Tool',
    list: ['Firebase', 'Git', 'Github'],
  ),
  SkillData(
    category: 'Android',
    list: [
      'MVVM',
      'Hilt',
      'Retrofit',
      'Flow',
      'Room',
      'Compose',
      'Material design',
      'Darkmode',
      'WebView',
    ],
  ),
  SkillData(
    category: 'Flutter',
    list: [
      'Riverpod',
      'Go Route / Auto Route',
      'Dio',
      'Hive',
      'Better Player',
      'Photo Manager',
      'Hooks',
      'Fimber',
      'Rxdart',
    ],
  ),
  SkillData(
    category: 'Firebase',
    list: [
      'FCM',
      'Crashlytics',
      'Social login',
      'App Hosting',
      'Store',
      'Storage',
      'Test Lab',
    ],
  ),
  SkillData(
    category: 'CICD',
    list: [
      'GitHub action flow',
    ],
  ),
];

final List<Project> projects = [
  Project(
    id: 1,
    title: 'IDEKU KIOSK',
    subtitle: 'Android App',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/jess-yen.firebasestorage.app/o/ideku-kiosk-google-play.png?alt=media&token=7c580aa8-f380-4b46-a7ea-3daf8ad23258',
    link:
        'https://docs.google.com/document/d/19IprPTxV_yZEW55SL0ugd0Nfm92q6GU0v1AkIcviebg/edit?tab=t.0#heading=h.4mtwzp1nrhvv',
  ),
  Project(
    id: 1,
    title: 'Moor',
    subtitle: 'Android App',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/jess-yen.firebasestorage.app/o/moor-google-play.png?alt=media&token=56a69eb3-00b8-4686-b21c-8491b92c55ef',
    link:
        'https://docs.google.com/document/d/19IprPTxV_yZEW55SL0ugd0Nfm92q6GU0v1AkIcviebg/edit?tab=t.0#heading=h.chou3n21et7h',
  ),
  Project(
    id: 1,
    title: 'WCAICHEN',
    subtitle: 'Web',
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/jess-yen.firebasestorage.app/o/wcaichen-demo.png?alt=media&token=e9dc529d-93de-4989-b11e-f3871ddd92f3',
    link:
        'https://docs.google.com/document/d/19IprPTxV_yZEW55SL0ugd0Nfm92q6GU0v1AkIcviebg/edit?tab=t.0#heading=h.bugpew3pjlpv',
  ),
];
