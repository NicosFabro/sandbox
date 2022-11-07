import 'package:flutter/material.dart';
import 'package:sandbox/src/features/features.dart';

import '../settings/settings_view.dart';

class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandbox'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemCount: features.length,
        itemBuilder: (context, index) {
          final key = features.keys.elementAt(index);

          return ListTile(
            title: Text(features[key]!.pageName),
            subtitle: Text(features[key]!.pageDescription),
            leading: const CircleAvatar(
              foregroundImage: AssetImage('assets/images/flutter_logo.png'),
            ),
            onTap: () {
              Navigator.restorablePushNamed(
                context,
                key,
              );
            },
          );
        },
      ),
    );
  }
}
