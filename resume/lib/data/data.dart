import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume/data/model/data_info.dart';
import 'package:resume/data/model/data_section.dart';
import 'package:resume/data/model/education.dart';
import 'package:resume/data/model/job.dart';
import 'package:resume/data/model/portfolio.dart';
import 'package:resume/data/model/program_skill.dart';
import 'package:resume/widgets/social_button.dart';

const String MOOR_MOBILE_GOOGLE_PLAY_URL =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Fmoor%2Fmoor-mobile-google-play.png?alt=media&token=8c14f643-7383-4d3c-ab09-f5ea75295368';
const String MOOR_TRANSLATION_BEFORE =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Fmoor%2Fmoor-before-translation.png?alt=media&token=2fc07381-92af-4d71-ac2b-82b1542735fc';
const String MOOR_TRANSLATION_AFTER =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Fmoor%2Fmoor-after-translation.png?alt=media&token=b40ffa52-deb0-49e4-aac2-349c3c01337f';
const String MOOR_CHAT_ROOM =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Fmoor%2Fmoor-chat-room.png?alt=media&token=85ccd8c0-6382-4567-b155-9577f86b6156';
const String MOOR_RECORD_VOICE =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Fmoor%2Fmoor-chat-room-record-voice.png?alt=media&token=b953ffa3-5a4f-4763-bc69-c26ba24bc7a1';
const String MOOR_MULTI_SELECTION =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Fmoor%2Fmoor-multi-selection.png?alt=media&token=bdb8b8c2-f7aa-4af7-8f36-5dfcb286dc32';
const String MOOR_POST =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Fmoor%2Fmoor-post.png?alt=media&token=c4d7eb15-d647-42b1-946f-3d6ad797529a';
const String MOOR_POST_SCHEDULE_DATE =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Fmoor%2Fmoor-post-schedule.png?alt=media&token=fedba07e-e569-45c9-806a-afe392e56f34';
const String MOOR_POST_SCHEDUKE_TIME =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Fmoor%2Fmoor-post-schedule-time.png?alt=media&token=71265ee3-40dc-45e3-97fb-7e4488edfe82';
const String MOOR_HOME_LIST =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Fmoor%2Fmoor-home.png?alt=media&token=e8bd507b-c765-4499-8684-bc1218aa215c';

const String KOITALK_GOOGLE_PLAY_URL =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Fkoitalk%2Fkoitalk-google-play.webp?alt=media&token=188e5c27-f047-4924-9833-c75c97b383e0';
const String KOITALK_STT =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Fkoitalk%2Fkoitalk-stt.png?alt=media&token=c9473b49-74d9-4bdb-b380-6711b3466ab0';

const String QMIIX_MOBILE_GOOGLE_PLAY_URL =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Fqmiix%2Fqmiix-mobile-google-play.png?alt=media&token=660c2795-89e1-4a8e-9c2d-87f67fd4dee7';
const String QMIIX_CALENDAR_LINE =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Fqmiix%2Fqmiix-calendar-line.jpeg?alt=media&token=d565f65f-3435-408b-ab88-2f51ca4b949c';
const String QMIIX_LINE_ACTION =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Fqmiix%2Fqmiix-line-action.jpeg?alt=media&token=c266309c-3285-4361-917a-4a25654b8152';

const String LEJOURNEY_MOBILE_GOOGLE_PLAY_URL =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Flejourney%2Flejourney-mobile-google-play.png?alt=media&token=479909ed-2939-4c85-91c7-c9a57c92d68e';
const String LEJOURNEY_THIRD_PARTY_LOGIN_URL =
    'https://firebasestorage.googleapis.com/v0/b/kafka-423811.appspot.com/o/cv%2Flejourney%2Flejuorney-third-party-login.png?alt=media&token=9f69d5a9-da6b-4587-89c0-2ca718a146e1';

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
          MOOR_MOBILE_GOOGLE_PLAY_URL,
        ],
      ),
      Feature(
        title: 'Notification translation.',
        urls: [
          MOOR_TRANSLATION_BEFORE,
          MOOR_TRANSLATION_AFTER,
        ],
      ),
      Feature(
          title: 'Clipping videos into shorts and display it on the player.'),
      Feature(title: 'Record logs to Logtail.'),
      Feature(title: 'New process for uploading assets.'),
      Feature(title: 'Show APNG gift animation.'),
      Feature(
        title: 'The notificaion from pusher web socket for the chat room.',
        urls: [
          MOOR_CHAT_ROOM,
        ],
      ),
      Feature(
        title: 'Media messages in chatroom.',
        urls: [
          MOOR_RECORD_VOICE,
          MOOR_MULTI_SELECTION,
        ],
      ),
      Feature(
        title: 'Schedule posts, and edit posts.',
        urls: [
          MOOR_POST,
          MOOR_POST_SCHEDULE_DATE,
          MOOR_POST_SCHEDUKE_TIME,
        ],
      ),
      Feature(
        title: 'Show home page list.',
        urls: [
          MOOR_HOME_LIST,
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
          KOITALK_GOOGLE_PLAY_URL,
        ],
      ),
      Feature(
        title:
            'Make STT(Speech to Text) and translation features on a video phone call.',
        urls: [
          KOITALK_STT,
        ],
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
          QMIIX_MOBILE_GOOGLE_PLAY_URL,
        ],
      ),
      Feature(
        title: 'Combine Google calendar and Line.',
        urls: [
          QMIIX_CALENDAR_LINE,
          QMIIX_LINE_ACTION,
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
          LEJOURNEY_MOBILE_GOOGLE_PLAY_URL,
        ],
      ),
      Feature(
        title: 'Social Login, ex. Apple ID, Google, Facebook, etc.',
        urls: [
          LEJOURNEY_THIRD_PARTY_LOGIN_URL,
        ],
      ),
      Feature(title: 'Feature: Register on first purchase.'),
      Feature(title: 'Publish the app on Google Play.'),
      Feature(title: 'Restful API'),
      Feature(title: 'FCM'),
    ],
  ),
];
