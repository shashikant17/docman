import 'package:flutter/material.dart';

import 'appbar.dart';
import 'dashboard/dashboard.dart';

// class Tabs extends StatelessWidget {
//   const Tabs({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: appbar,
//           body: TabBarView(
//             children: [
//               docker_options,
//               const Icon(Icons.settings),
//               // Icon(Icons.directions_bike),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

var tabController = DefaultTabController(
  length: 2,
  child: Scaffold(
    appBar: appbar,
    body: TabBarView(
      children: [
        docker_options,
        const Icon(Icons.settings),
        // Icon(Icons.directions_bike),
      ],
    ),
  ),
);
