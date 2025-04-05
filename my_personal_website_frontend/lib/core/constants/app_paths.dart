class AppPaths {
  static IconsPaths get icons => IconsPaths();

  static ImagesPaths get images => ImagesPaths();

  static AnimatedImagesPaths get animatedImages => AnimatedImagesPaths();

  static VectorsPaths get vectors => VectorsPaths();

  static RoutesPaths get routes => RoutesPaths();
}

class IconsPaths {
  final String favIcon = 'assets/icons/favicon.ico';
  final String icon = 'assets/icons/icon.png';
}

class ImagesPaths {
  final String myPersonalImage = 'assets/images/my-personal-image.webp';
  //certificates
  final String mosAssociateCertificate =
      'assets/images/mos-associate-certificate.webp';
  final String softwareDevelopmentCertificate =
      'assets/images/software-development-certificate.webp';
  final String ibmGitCertificate = 'assets/images/ibm-git-certificate.webp';
  final String googleUxCertificate = 'assets/images/google-ux-certificate.webp';
  final String amideastCertificate = 'assets/images/amideast-certificate.webp';
  //projects
  final String travingloAppProject = 'assets/images/travinglo-app-project.webp';
  final String travinglo2Project = 'assets/images/travinglo-2-project.webp';
  //profile images
  final String youssefProfileImage = 'assets/images/youssef-profile-image.webp';
  final String kaoutarProfileImage = 'assets/images/kaoutar-profile-image.webp';
  final String echarradiProfileImage =
      'assets/images/echarradi-profile-image.webp';
}

class AnimatedImagesPaths {}

class VectorsPaths {
  final String arrowTopIcon = 'assets/vectors/arrow-top-icon.svg';
  final String menuHamburgerIcon = 'assets/vectors/menu-hamburger-icon.svg';
  final String closeIcon = 'assets/vectors/close-icon.svg';
  //techs logos
  final String adobeXd = 'assets/vectors/adobe-xd.svg';
  final String androidStudio = 'assets/vectors/android-studio.svg';
  final String bootstrap = 'assets/vectors/bootstrap.svg';
  final String cPlusPlus = 'assets/vectors/c-plusplus.svg';
  final String cSharp = 'assets/vectors/c-sharp.svg';
  final String css3 = 'assets/vectors/css3.svg';
  final String dart = 'assets/vectors/dart.svg';
  final String docker = 'assets/vectors/docker.svg';
  final String express = 'assets/vectors/express.svg';
  final String fastify = 'assets/vectors/fastify.svg';
  final String figma = 'assets/vectors/figma.svg';
  final String flutter = 'assets/vectors/flutter.svg';
  final String git = 'assets/vectors/git.svg';
  final String github = 'assets/vectors/github.svg';
  final String gitlab = 'assets/vectors/gitlab.svg';
  final String html5 = 'assets/vectors/html5.svg';
  final String java = 'assets/vectors/java.svg';
  final String vbNet = 'assets/vectors/vb-net.svg';
  final String javascript = 'assets/vectors/javascript.svg';
  final String typescript = 'assets/vectors/typescript.svg';
  final String jira = 'assets/vectors/jira.svg';
  final String kotlin = 'assets/vectors/kotlin.svg';
  final String nodeJs = 'assets/vectors/node-js.svg';
  final String npm = 'assets/vectors/npm.svg';
  final String yarn = 'assets/vectors/yarn.svg';
  final String php = 'assets/vectors/php.svg';
  final String sql = 'assets/vectors/sql.svg';
  final String sqlite = 'assets/vectors/sqlite.svg';
  final String tSql = 'assets/vectors/t-sql.svg';
  final String mySql = 'assets/vectors/my-sql.svg';
  final String postgresSql = 'assets/vectors/postgres-sql.svg';
  final String react = 'assets/vectors/react.svg';
  final String redux = 'assets/vectors/redux.svg';
  final String sass = 'assets/vectors/sass.svg';
  final String xml = 'assets/vectors/xml.svg';
  final String sequelize = 'assets/vectors/sequelize.svg';
  final String sketch = 'assets/vectors/sketch.svg';
  final String tensorflow = 'assets/vectors/tensorflow.svg';
  final String visualStudio = 'assets/vectors/visual-studio.svg';
  final String postman = 'assets/vectors/postman.svg';
  final String heroku = 'assets/vectors/heroku.svg';
}

class RoutesPaths {
  // Define route paths
  final String homePageScreen = '/';
  final String maintenanceScreen = '/maintenance';
  final String badRoutingScreen = '/bad-routing';

  // Map for French route names
  final Map<String, String> routeNames = {
    '/': 'My Space',
    '/maintenance': 'Maintenance',
    '/bad-routing': 'Bad Routing',
  };

  // Method to get the French route name
  String getRouteName(String route) => routeNames[route] ?? 'Unknown Route';
}
