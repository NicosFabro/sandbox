import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sandbox/src/instagram_profile/instagram_profile.dart';
import 'package:sandbox/src/models/page_model.dart';

class InstagramProfileView extends StatefulWidget {
  const InstagramProfileView({Key? key}) : super(key: key);

  static const routeName = '/instagram_profile';

  static const pageModel = const PageModel(
    pageName: 'Nested Scroll View (Slivers)',
    pageDescription: 'Instagram Profile',
  );

  @override
  State<InstagramProfileView> createState() => _InstagramProfileViewState();
}

class _InstagramProfileViewState extends State<InstagramProfileView> {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, isInnerBoxScrolled) => [
            SliverAppBar(
              pinned: true,
              centerTitle: false,
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    builder: (context) =>
                        const InstagramProfileModalBottomSheet(),
                  );
                },
                child: Row(
                  children: [
                    Text(localization.instagramProfile),
                    const Icon(Icons.keyboard_arrow_down_outlined),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_outlined),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu_outlined),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ],
            ),
            SliverToBoxAdapter(child: const InstagramProfileSliverHeader()),
            SliverPersistentHeader(
              pinned: true,
              delegate: InstagramProfileTabBarDelegate(),
            ),
          ],
          body: const TabBarView(
            children: [
              InstagramProfileGridSquares(),
              InstagramProfileGridRectangles(),
              InstagramProfileGridSquares(),
            ],
          ),
        ),
      ),
    );
  }
}
