import 'package:docman/pages/dashboard/dashboard_attribute_list.dart';
import 'package:docman/pages/settings/setting_attribute_list.dart';
import 'package:flutter/material.dart';

import 'appbar.dart';

var tabController = DefaultTabController(
  length: 2,
  child: Scaffold(
    appBar: appbar,
    body: const TabBarView(
      children: [
        DashBoard(),
        Settings()
        // docker_options,
        // const Icon(Icons.settings),
      ],
    ),
  ),
);
