import 'package:flutter/cupertino.dart';

import '../../../../core/resources/persisted_space_background_controller.dart';
import '../../../../locator.dart';

class SpaceBackgroundCustomScroller extends StatefulWidget {
  final Widget child;
  final bool? reverse;
  final void Function(double offset) onScroll;

  const SpaceBackgroundCustomScroller({
    super.key,
    required this.child,
    this.reverse,
    required this.onScroll,
  });

  @override
  State<SpaceBackgroundCustomScroller> createState() =>
      _SpaceBackgroundCustomScrollerState();
}

class _SpaceBackgroundCustomScrollerState
    extends State<SpaceBackgroundCustomScroller> {
  final ScrollController _controller = ScrollController();
  double _previousOffset = 0.0;
  double _scrollSpeed = 0.0;

  // background controller locator
  final PersistedSpaceBackgroundController _spaceBackgroundController =
      locator<PersistedSpaceBackgroundController>();

  void _scrollListener() {
    double currentOffset = _controller.offset;
    double scrollSpeed = currentOffset - _previousOffset;

    setState(() {
      _scrollSpeed = scrollSpeed;
    });

    if (currentOffset != _previousOffset) {
      // Scrolling is happening
      _spaceBackgroundController.setStarSpeed(newSpeed: _scrollSpeed / 32);
    } else {
      // Scrolling has stopped
      _spaceBackgroundController.setStarSpeed();
    }

    // Call the offset callback if provided
    widget.onScroll.call(currentOffset);

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
    return NotificationListener<ScrollEndNotification>(
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
