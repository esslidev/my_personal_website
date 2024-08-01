import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_paths.dart';
import '../../../../features/presentation/screens/contact_me/contact_me.dart';

class ContactMeLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.contactMeScreen];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('contact-me'),
          title: 'contact-me',
          child: ContactMeScreen()),
    ];
    return pages;
  }
}
