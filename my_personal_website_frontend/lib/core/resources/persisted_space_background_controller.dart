class PersistedSpaceBackgroundController {
  double defaultStarSpeed = 0.2;
  double starSpeed = 0.2;
  int starCount = 100;
  final Duration _debounceDuration = const Duration(milliseconds: 60);

  void setStarSpeed({double? newSpeed, Duration? duration}) {
    if (newSpeed != null) {
      starSpeed = newSpeed;
      if (duration != null) {
        Future.delayed((duration), () {
          starSpeed = defaultStarSpeed;
        });
      }
    } else {
      Future.delayed((_debounceDuration), () {
        starSpeed = defaultStarSpeed;
      });
    }
  }

  void setStarCount(int newCount) {
    starCount = newCount;
  }
}
