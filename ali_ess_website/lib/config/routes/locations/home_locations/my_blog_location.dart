import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_paths.dart';
import '../../../../features/presentation/screens/my_blog/my_blog.dart';

class MyBlogLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.myBlogScreen];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('my-blog'), title: 'my-blog', child: MyBlogScreen()),
    ];
    return pages;
  }
}
