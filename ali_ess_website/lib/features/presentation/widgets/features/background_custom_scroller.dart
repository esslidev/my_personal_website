import 'package:flutter/cupertino.dart';

import '../../../../core/util/responsive_size_adapter.dart';
import '../../../../locator.dart';
import '../../controllers/persisted_background/persisted_background_controller.dart';

class BackgroundCustomScroller extends StatefulWidget {
  final Widget child;
  final bool? reverse;

  const BackgroundCustomScroller(
      {super.key, required this.child, this.reverse});

  @override
  State<BackgroundCustomScroller> createState() =>
      _BackgroundCustomScrollerState();
}

class _BackgroundCustomScrollerState extends State<BackgroundCustomScroller> {
  final ScrollController _controller = ScrollController();
  double _previousOffset = 0.0;
  double _scrollSpeed = 0.0;

  // background controller locator
  PersistedBackgroundController backgroundController =
      locator<PersistedBackgroundController>();

  void _scrollListener() {
    double currentOffset = _controller.offset;
    double scrollSpeed = currentOffset - _previousOffset;

    print("Current Offset: $currentOffset");
    print("Scroll Speed: $scrollSpeed");

    setState(() {
      _scrollSpeed = scrollSpeed;
    });

    if (currentOffset != _previousOffset) {
      // Scrolling is happening
      backgroundController.setStarSpeed(newSpeed: _scrollSpeed / 8);
    } else {
      // Scrolling has stopped
      backgroundController.setStarSpeed();
    }

    _previousOffset = currentOffset;
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // responsive px adapter
    final ResponsiveSizeAdapter R = ResponsiveSizeAdapter(context);

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        _scrollListener();
        return true;
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: widget.reverse ?? false,
        controller: _controller,
        child: widget.child,
      ),
    );
  }
}
