import 'package:flutter/material.dart';
import 'package:sandbox/src/instagram_profile/instagram_profile.dart';
import 'package:sandbox/src/paint/paint.dart';
import 'package:sandbox/src/features/features_list_view.dart';
import 'package:sandbox/src/settings/settings_controller.dart';
import 'package:sandbox/src/settings/settings_view.dart';

Route<dynamic> onGenerateRoute({
  required RouteSettings routeSettings,
  required SettingsController settingsController,
}) {
  return MaterialPageRoute<void>(
    settings: routeSettings,
    builder: (BuildContext context) {
      switch (routeSettings.name) {
        case SettingsView.routeName:
          return SettingsView(controller: settingsController);
        case InstagramProfileView.routeName:
          return const InstagramProfileView();
        case PaintPage.routeName:
          return const PaintPage();
        case SampleItemListView.routeName:
        default:
          return const SampleItemListView();
      }
    },
  );
}
