class AppPaths {
  static FontsPaths get fonts => FontsPaths();

  static IconsPaths get icons => IconsPaths();

  static ImagesPaths get images => ImagesPaths();

  static VectorsPaths get vectors => VectorsPaths();

  static RoutesPaths get routes => RoutesPaths();
}

class FontsPaths {
  final String robotoBold = 'assets/fonts/roboto-bold.ttf';
  final String robotoBoldItalic = 'assets/fonts/roboto-bolditalic.ttf';
  final String robotoItalic = 'assets/fonts/roboto-italic.ttf';
  final String robotoRegular = 'assets/fonts/roboto-regular.ttf';
}

class IconsPaths {
  final String favIcon = 'assets/icons/favicon.png';
  final String icon = 'assets/icons/icon.png';
}

class ImagesPaths {
  final String logo = 'assets/images/logo.png';
  final String profilePicture = 'assets/images/profile-picture.jpg';
}

class VectorsPaths {
// Home nav icons paths
  final String logo = 'assets/vectors/logo.svg';
  final String profileIcon = 'assets/vectors/profile-icon.svg';
  final String wishlistIcon = 'assets/vectors/wishlist-icon.svg';
  final String cartIcon = 'assets/vectors/cart-icon.svg';
  final String searchIcon = 'assets/vectors/search-icon.svg';
  final String arrowDownIcon = 'assets/vectors/arrow-down-icon.svg';
  final String longArrowRightIcon = 'assets/vectors/long-arrow-right-icon.svg';
  final String ratingStarIcon = 'assets/vectors/rating-star-icon.svg';
  final String upworkIcon = 'assets/vectors/upwork-icon.svg';
  final String githubIcon = 'assets/vectors/github-icon.svg';
  final String linkedinIcon = 'assets/vectors/linkedin-icon.svg';
}

class RoutesPaths {
  final String homeScreen = '/home';
  final String dashboardScreen = '/home/dashboard';
  final String aboutMeScreen = '/home/about-me';
  final String myPortfolioScreen = '/home/my-portfolio';
  final String myBlogScreen = '/home/my-blog';
  final String contactMeScreen = '/home/contact-me';
  final String badRoutingScreen = '/bad-routing';

  String getRouteName(String route) {
    switch (route) {
      case '/home':
        return 'Home';
      case '/home/dashboard':
        return 'Dashboard';
      case '/home/about-me':
        return 'About me';
      case '/home/my-portfolio':
        return 'My portfolio';
      case '/home/my-blog':
        return 'My blog';
      case '/home/contact-me':
        return 'Contact me';
      case '/bad-routing':
        return 'Bad routing';
      default:
        return 'Unknown Route';
    }
  }
}
