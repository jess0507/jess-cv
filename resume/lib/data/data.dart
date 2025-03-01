import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/data/model/data_info.dart';
import 'package:resume/data/model/data_section.dart';
import 'package:resume/data/model/education.dart';
import 'package:resume/data/model/job.dart';
import 'package:resume/data/model/portfolio.dart';
import 'package:resume/data/model/program_skill.dart';
import 'package:resume/widgets/social_button.dart';

const String GOOGLE_DRIVE_URL =
    'https://drive.usercontent.google.com/download?';

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

final List<DataSection> toolSectionList = [
  DataSection(
    title: 'Language',
    list: [
      DataInfo(title: 'Chinese', extra: 'Mother language'),
      DataInfo(title: 'English', extra: 'Second language'),
    ],
  ),
  DataSection(
    title: 'Program',
    list: [
      DataInfo(title: 'Android'),
      DataInfo(title: 'Kotlin'),
      DataInfo(title: 'Flutter'),
      DataInfo(title: 'Dart'),
      DataInfo(title: 'Java'),
      DataInfo(title: 'React Native'),
      DataInfo(title: 'Typescript'),
      DataInfo(title: 'C++'),
      DataInfo(title: 'C'),
    ],
  ),
  DataSection(
    title: 'Tool',
    list: [
      DataInfo(title: 'Android Studio'),
      DataInfo(title: 'VScode'),
      DataInfo(title: 'Firebase'),
      DataInfo(title: 'Git'),
      DataInfo(title: 'Github'),
    ],
  ),
];

final List<Job> careerSectionList = [
  Job(
    companyName: 'SWAG',
    position: 'Flutter/Android App Engineer',
    time: '2022.10 - 2024.04',
    categories: [
      WorkCategory(
        name: 'Program',
        entries: [
          WorkEntry(
            name: 'Features',
            descriptions: [
              'Clipping videos into shorts and display it on the player.',
              'Notification translation.',
              'Record logs to Logtail.',
              'Media selection in chatroom.',
              'Schedule posts, and edit posts.',
              'New process for uploading assets.',
              'Show APNG gift animation.',
              'Show home page list.',
              'Story List view.',
            ],
          ),
        ],
      ),
    ],
  ),
  Job(
    companyName: 'UG全球遊戲科技有限公司',
    position: 'React Native/Android App Engineer',
    time: '2020.8 - 2022.8',
    categories: [
      WorkCategory(
        name: 'Program',
        entries: [
          WorkEntry(
            name: '',
            descriptions: [
              'Refactoring android to new react native for apps.',
              'Seemless update via code push.',
              'Maintain the Android and React Native App.',
              'Maintain the webview apps. ',
            ],
          ),
        ],
      ),
    ],
  ),
  Job(
    companyName: 'QNAP威聯通科技股份有限公司',
    position: 'Android App Engineer',
    time: '2019.8 - 2020.8',
    categories: [
      WorkCategory(
        name: 'Program',
        entries: [
          WorkEntry(
            name: '',
            descriptions: [
              'Make STT(Speech to Text) and translation features on a video phone call. ',
              'Social Login, ex. Apple ID, Google, Facebook, etc.',
              'Using restful APIs to transfer the data to backend. ',
              'Using MVVM and Jetpack SDK to maintain the app projects.',
              'Using Coroutine to manage the upload image task. ',
            ],
          ),
        ],
      ),
      WorkCategory(
        name: 'Product',
        entries: [
          WorkEntry(
            name: 'KoiTalk',
            descriptions: [
              'A video and audio P2P app, up to four people can video at the same time.',
            ],
          ),
          WorkEntry(
            name: 'Qmiix',
            descriptions: [
              'Create scripts that combine actions and upload files to specific storage space. ',
            ],
          ),
        ],
      ),
    ],
  ),
  Job(
    companyName: 'Edallianz Pte. Ltd 新加坡商藍恩資訊股份有限公司',
    position: 'Android App Engineer',
    time: '2019.1 - 2019.8',
    categories: [
      WorkCategory(
        name: 'Program',
        entries: [
          WorkEntry(
            name: '',
            descriptions: [
              'Feature: Register on first purchase.',
              'Publish the app on Google Play.',
              'Use restful API to transfer data between backend and client.',
              'Maintain Firebase Cloud Messages.',
            ],
          ),
        ],
      ),
      WorkCategory(
        name: 'Product',
        entries: [
          WorkEntry(
            name: 'LeJourney Find The Right Class',
            descriptions: [
              'A course e-commerce.',
            ],
          ),
        ],
      ),
    ],
  ),
];

final List<Education> educationInfoList = [
  Education(
    school: 'National Chung Hsing University',
    degree: 'Master of Computer Science and Engineering',
    thesis:
        "Master's thesis: A Load-aware SSD Caching Scheme for Multi-tiered Storage Systems",
    thesisUrl:
        'https://docs.google.com/presentation/d/1kkx8bNr3lF8TEQn4y_qbP707eWye1mav/edit?usp=sharing&ouid=105220687332013679769&rtpof=true&sd=true',
    time: '2017 - 2019',
  ),
  Education(
    school: 'National United University',
    degree: 'Bachelor of Computer Science and Engineering',
    thesis: "Bachelor's thesis: Trademark recognition system",
    thesisUrl:
        'https://docs.google.com/presentation/d/0B8J4DR-edFMqWERCNHJOYXgxRDA/edit?usp=sharing&ouid=105220687332013679769&resourcekey=0-fXIMtR_fA01f1Ix5SDVTBQ&rtpof=true&sd=true',
    time: '2012 - 2016',
  ),
];

final programSkillList = [
  ProgramSkill(
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
  ProgramSkill(
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
  ProgramSkill(
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
  ProgramSkill(
    category: 'CICD',
    list: [
      'GitHub action flow',
    ],
  ),
];

final List<Portfolio> portfolioList = [
  Portfolio(
    project: 'Moor',
    company: 'SWAG',
    description:
        'An app for live streaming, fan chats, and uploading video and audio posts.',
    features: [
      Feature(
        title: 'On google play',
        urls: [
          '${GOOGLE_DRIVE_URL}id=1l8bMyYRlXihMYWfkiOan_Q3dJq6txLYr',
        ],
      ),
      Feature(
        title: 'Notification translation.',
        urls: [
          '${GOOGLE_DRIVE_URL}id=1aYJDW21_07aliwc8G4u7o1bxur1yFfoh',
          '${GOOGLE_DRIVE_URL}id=10AUrPWgo9C46vuhFcVrv_9ujJJyO4OgX',
        ],
      ),
      Feature(
          title: 'Clipping videos into shorts and display it on the player.'),
      Feature(title: 'Record logs to Logtail.'),
      Feature(title: 'New process for uploading assets.'),
      Feature(title: 'Show APNG gift animation.'),
      Feature(
        title: 'Media file selections in chatroom.',
        urls: [
          '${GOOGLE_DRIVE_URL}id=1CqxNhSLBshbpBV_DvkY9wJoB4rpjSsko',
          '${GOOGLE_DRIVE_URL}id=1aYJDW21_07aliwc8G4u7o1bxur1yFfoh',
        ],
      ),
      Feature(
        title: 'Schedule posts, and edit posts.',
        urls: [
          '${GOOGLE_DRIVE_URL}id=1EpAJPozIcKJPA4N4c3cYaXuIjXejZMuS',
          '${GOOGLE_DRIVE_URL}id=1RCd8q8JvuHB3iM8ShAHHTdUY_fC-LZ1U',
        ],
      ),
      Feature(
        title: 'Show home page list.',
        urls: [
          '${GOOGLE_DRIVE_URL}id=1dMi2o4quv0NxpEKQQJ6jrbch0EqB6XFj',
          '${GOOGLE_DRIVE_URL}id=1J0OMOnuuT3wxwgD4wZYd47ou1Jnn6TRC',
        ],
      ),
      Feature(title: 'Story List view.'),
    ],
  ),
  Portfolio(
    project: 'Outsourced apps',
    company: 'UG全球遊戲科技有限公司',
    features: [
      Feature(title: 'Refactoring android to new react native for apps.'),
      Feature(title: 'Seemless update via code push.'),
      Feature(title: 'Maintain the Android and React Native App.'),
      Feature(title: 'Maintain the webview apps.'),
    ],
  ),
  Portfolio(
    project: 'KoiTalk',
    company: 'QNAP',
    description: 'Video call app.',
    features: [
      Feature(
        title: 'On google play',
        urls: [
          '${GOOGLE_DRIVE_URL}id=18Uin7f7RDIcmNpKHE2ZnYXT5uS5sFSyj',
        ],
      ),
      Feature(
        title:
            'Make STT(Speech to Text) and translation features on a video phone call.',
        urls: [],
      ),
      Feature(
        title: 'Social Login, ex. Apple ID, Google, Facebook, etc.',
        urls: [],
      ),
    ],
  ),
  Portfolio(
    project: 'Qmiix',
    company: 'QNAP',
    description:
        'Combine the triggers and the actions between the applications.',
    features: [
      Feature(
        title: 'On google play',
        urls: [
          '${GOOGLE_DRIVE_URL}id=1hOZgXuuNpik6lX3YDQFaWR6mS-jQSqaK',
        ],
      ),
      Feature(
        title: 'Combine Google calendar and Line.',
        urls: [
          '${GOOGLE_DRIVE_URL}id=1tVwVt05s4-_P4N39iU0nD4Omfykr8QNg',
          '${GOOGLE_DRIVE_URL}id=1L1jt8T_wKq9t23-KSnk-wAuZLtCtXNWb',
        ],
      ),
      Feature(title: 'Using Coroutine to uploads images to NAS.'),
    ],
  ),
  Portfolio(
    project: 'LeJourney Find The Right Class',
    company: 'Edallianz Pte. Ltd 新加坡商藍恩資訊股份有限公司',
    description: 'A course e-commerce.',
    features: [
      Feature(
        title: 'On google play',
        urls: [
          '${GOOGLE_DRIVE_URL}id=1WmY4huBDNZ9WSTOPFsWXHOabkL-PZYUz',
        ],
      ),
      Feature(
        title: 'Social Login, ex. Apple ID, Google, Facebook, etc.',
        urls: [
          '${GOOGLE_DRIVE_URL}id=1JdN88qr8c8MbspzJR-iLM6vC91xSVqc-',
        ],
      ),
      Feature(title: 'Feature: Register on first purchase.'),
      Feature(title: 'Publish the app on Google Play.'),
      Feature(title: 'Restful API'),
      Feature(title: 'FCM'),
    ],
  ),
];
