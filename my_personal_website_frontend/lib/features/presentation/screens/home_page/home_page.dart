import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_paths.dart';
import '../../../../core/util/app_util.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../../widgets/common/custom_field.dart';
import '../../widgets/features/space_background_custom_scroller.dart';
import 'widgets/about.dart';
import 'widgets/certificates_slider.dart';
import 'widgets/experience_education.dart';
import 'widgets/footer.dart';
import 'widgets/get_in_touch.dart';
import 'widgets/header.dart';
import 'widgets/intro.dart';
import 'widgets/persisted_space_background/persisted_space_background.dart';
import 'widgets/portfolio.dart';
import 'widgets/skills_technologies.dart';
import 'widgets/testimonials_slider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late ResponsiveSizeAdapter r;

  final GlobalKey _introKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsTechsKey = GlobalKey();
  final GlobalKey _experienceEducationKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _getInTouchKey = GlobalKey();

  final ValueNotifier<int> _activeButtonNotifier = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
    r = ResponsiveSizeAdapter(context);
  }

  Widget _buildHomePage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        PersistedSpaceBackground(),
        SpaceBackgroundCustomScroller(
          reverse: false,

          onScroll: (double offset) {
            if (offset <=
                (AppUtil.getPositionByGlobalKey(_introKey).dy +
                    AppUtil.getSizeByGlobalKey(_introKey).height +
                    r.size(100))) {
              _activeButtonNotifier.value = 1;
            } else if (offset <=
                (AppUtil.getPositionByGlobalKey(_aboutKey).dy +
                    AppUtil.getSizeByGlobalKey(_aboutKey).height +
                    AppUtil.getSizeByGlobalKey(_skillsTechsKey).height +
                    r.size(200))) {
              _activeButtonNotifier.value = 2;
            } else if (offset <=
                (AppUtil.getPositionByGlobalKey(_portfolioKey).dy +
                    AppUtil.getSizeByGlobalKey(_portfolioKey).height +
                    r.size(100))) {
              _activeButtonNotifier.value = 3;
            } else {
              _activeButtonNotifier.value = 4;
            }
          },
          child: CustomField(
            minHeight: screenSize.height,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Intro(key: _introKey),
              About(key: _aboutKey),
              SkillsTechnologies(
                key: _skillsTechsKey,
                frontendSkills: [
                  Skill(name: 'HTML5', svgPath: AppPaths.vectors.html5),
                  Skill(name: 'CSS3', svgPath: AppPaths.vectors.css3),
                  Skill(name: 'Sass', svgPath: AppPaths.vectors.sass),
                  Skill(name: 'XML', svgPath: AppPaths.vectors.xml),
                  Skill(name: 'Bootstrap', svgPath: AppPaths.vectors.bootstrap),
                  Skill(name: 'React', svgPath: AppPaths.vectors.react),
                  Skill(name: 'Vb.net', svgPath: AppPaths.vectors.vbNet),
                  Skill(name: 'Redux', svgPath: AppPaths.vectors.redux),
                  Skill(name: 'Flutter', svgPath: AppPaths.vectors.flutter),
                  Skill(
                    name: 'JavaScript',
                    svgPath: AppPaths.vectors.javascript,
                  ),
                  Skill(
                    name: 'Typescript',
                    svgPath: AppPaths.vectors.typescript,
                  ),
                  Skill(name: 'Dart', svgPath: AppPaths.vectors.dart),
                ],
                backendSkills: [
                  Skill(name: 'Node.js', svgPath: AppPaths.vectors.nodeJs),
                  Skill(name: 'Express', svgPath: AppPaths.vectors.express),
                  Skill(name: 'Fastify', svgPath: AppPaths.vectors.fastify),
                  Skill(name: 'Sequelize', svgPath: AppPaths.vectors.sequelize),
                  Skill(name: 'Sql', svgPath: AppPaths.vectors.sql),
                  Skill(name: 'Sqlite', svgPath: AppPaths.vectors.sqlite),
                  Skill(name: 'MySql', svgPath: AppPaths.vectors.mySql),
                  Skill(name: 'Transact Sql', svgPath: AppPaths.vectors.tSql),
                  Skill(
                    name: 'PostgresSQL',
                    svgPath: AppPaths.vectors.postgresSql,
                  ),
                  Skill(name: 'PHP', svgPath: AppPaths.vectors.php),
                  Skill(name: 'Java', svgPath: AppPaths.vectors.java),
                  Skill(name: 'C#', svgPath: AppPaths.vectors.cSharp),
                  Skill(name: 'C++', svgPath: AppPaths.vectors.cPlusPlus),
                  Skill(name: 'Kotlin', svgPath: AppPaths.vectors.kotlin),
                ],
                devOpsSkills: [
                  Skill(name: 'Docker', svgPath: AppPaths.vectors.docker),
                  Skill(name: 'Git', svgPath: AppPaths.vectors.git),
                  Skill(name: 'GitHub', svgPath: AppPaths.vectors.github),
                  Skill(name: 'GitLab', svgPath: AppPaths.vectors.gitlab),
                  Skill(name: 'Jira', svgPath: AppPaths.vectors.jira),
                  Skill(name: 'NPM', svgPath: AppPaths.vectors.npm),
                  Skill(name: 'Yarn', svgPath: AppPaths.vectors.yarn),
                  Skill(
                    name: 'Android Studio',
                    svgPath: AppPaths.vectors.androidStudio,
                  ),
                  Skill(
                    name: 'Visual Studio',
                    svgPath: AppPaths.vectors.visualStudio,
                  ),
                  Skill(name: 'Adobe XD', svgPath: AppPaths.vectors.adobeXd),
                  Skill(name: 'Figma', svgPath: AppPaths.vectors.figma),
                  Skill(name: 'Sketch', svgPath: AppPaths.vectors.sketch),
                  Skill(
                    name: 'TensorFlow',
                    svgPath: AppPaths.vectors.tensorflow,
                  ),
                  Skill(name: 'Postman', svgPath: AppPaths.vectors.postman),
                  Skill(name: 'Heroku', svgPath: AppPaths.vectors.heroku),
                ],
              ),
              ExperienceEducation(
                key: _experienceEducationKey,
                experiences: [
                  Experience(
                    title: 'Full Stack Developer',
                    companyName: 'Devwave',
                    startDate: DateTime(2024, 2), // March 2023
                    description:
                        "Designed a custom system with clean architecture, Flutter, and BLoC for fast native app development. Developed an e-commerce site for Luxora Cosmetics and created UIs using CSS, HTML, and React.",
                  ),
                  Experience(
                    title: 'Auto-entrepreneur | Full Stack Developer',
                    companyName: 'PixelShades Company',
                    startDate: DateTime(2022, 9),
                    endDate: DateTime(2024, 1), // March 2023
                    description:
                        "Implemented new features, investigated production issues, and integrated internal and third-party APIs. Wrote automated tests (unit and feature) and participated in code reviews. Contributed to software design and architecture. Backend stack: Prisma, TypeScript, Express, WebSockets, PostgreSQL. Frontend stack: React.js, Redux, Redux-Saga, TypeScript, Clean Architecture.",
                  ),
                ],
                educations: [
                  Education(
                    certificateName:
                        'Diplômé en Développement des Systèmes d\'Information | BAC+2',
                    schoolName: 'Lycée Lissane Eddine ibn Al khatib',
                    date: DateTime(2021, 6), // March 2023
                  ),
                  Education(
                    certificateName: 'Diplômé en Science physiques | BAC',
                    schoolName: 'Lycée Qualifiant Hassan II',
                    date: DateTime(2015, 7), // March 2023
                  ),
                ],
              ),
              CertificatesSlider(
                certificates: [
                  Certificate(
                    name: 'Youth\'s innovative skills | Amideast',
                    imagePath: AppPaths.images.amideastCertificate,
                  ),
                  Certificate(
                    name: 'Microsoft Office Specialist',
                    imagePath: AppPaths.images.mosAssociateCertificate,
                  ),
                  Certificate(
                    name: 'Getting started with Git and Github | IBM',
                    imagePath: AppPaths.images.ibmGitCertificate,
                  ),
                  Certificate(
                    name: 'Software Development | University of leeds',
                    imagePath: AppPaths.images.softwareDevelopmentCertificate,
                  ),
                  Certificate(
                    name: 'Foundations of User Experience (UX) design | Google',
                    imagePath: AppPaths.images.googleUxCertificate,
                  ),
                ],
              ),
              Portfolio(
                key: _portfolioKey,
                projects: [
                  PortfolioProject(
                    imagePath: AppPaths.images.travinglo2Project,
                    title: 'Travinglo 2.0 – Cross-Platform Enhanced Version',
                    techs: [
                      'Flutter',
                      'Dart',
                      'Custom Clean Architecture',
                      'BLoC',
                      'Hive',
                      'Json',
                      'Beamer',
                      'Ali\'s Backend System',
                    ],
                    description:
                        'Travinglo 2.0 is a revamped cross-platform language learning app with multi-theme and multi-language support, online features, and a modern design for an enhanced user experience.',
                  ),
                  PortfolioProject(
                    imagePath: AppPaths.images.travingloAppProject,
                    title: 'Travinglo Learning Languages App',
                    techs: ['Kotlin', 'MVVM Architecture', 'XML', 'Sqlite'],
                    description:
                        'Travinglo is a Kotlin-based Android app for learning multiple languages and dialects through interactive games, images, and sounds. It supports dark and light modes, leverages GPU multi-threading for speed, and includes progress-tracking statistics for a personalized learning experience.',
                  ),
                ],
              ),
              TestimonialsSlider(
                testimonials: [
                  Testimonial(
                    imagePath: AppPaths.images.kaoutarProfileImage,
                    customerName: 'Kaoutar Ouahidi',
                    professionTitle: 'Administrative',
                    testimonial:
                        'I highly appreciate Ali Salem for his professionalism and expertise as a Full Developer. His technical skills, problem-solving abilities, and commitment to quality greatly contributed to our projects success. Working with him was a pleasure, and I strongly recommend him as a reliable and skilled professional.',
                  ),
                  Testimonial(
                    imagePath: AppPaths.images.youssefProfileImage,
                    customerName: 'Youssef Ben Larbi Delai',
                    professionTitle: 'CEO, Devwave',
                    testimonial:
                        'Ali Salem Essouiah is an exceptional software engineer, technician, and web developer. His deep expertise, problem-solving skills, and commitment to excellence consistently deliver outstanding results. Beyond technical proficiency, his strong communication and teamwork foster a productive work environment. I highly recommend him for any software engineering or web development role.',
                  ),
                  Testimonial(
                    imagePath: AppPaths.images.echarradiProfileImage,
                    customerName: 'Youssef Echarradi',
                    professionTitle: 'Computer Networks',
                    testimonial:
                        'Ali Salem Essouiah has a solid understanding of software development and a structured approach to problem-solving. His ability to integrate software solutions with network systems demonstrates his versatility and technical competence. He is reliable, professional, and a great team player, making collaboration smooth and efficient.',
                  ),
                ],
              ),
              GetInTouch(key: _getInTouchKey),
              Footer(),
            ],
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _activeButtonNotifier,
          builder: (BuildContext context, int activeButton, Widget? child) {
            return Header(
              onIntroPressed: () {
                Scrollable.ensureVisible(
                  _introKey.currentContext!,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              onAboutPressed: () {
                Scrollable.ensureVisible(
                  _aboutKey.currentContext!,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              onPortfolioPressed: () {
                Scrollable.ensureVisible(
                  _portfolioKey.currentContext!,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              onGetInTouchPressed: () {
                Scrollable.ensureVisible(
                  _getInTouchKey.currentContext!,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              activeButton: activeButton,
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark.backgroundPrimary,
      body: _buildHomePage(context),
    );
  }
}
