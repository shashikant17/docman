import 'package:flutter/material.dart';

import 'pages/dashboard/containers/show_container.dart';
import 'pages/dashboard/images/show_images.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'DocMan';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // primaryColor: const Color(0xff030303),
        scaffoldBackgroundColor: const Color(0xffe7eaed),
        appBarTheme: const AppBarTheme(
          // backgroundColor: Color(0xff030303),
          backgroundColor: Color(0xff232F34),
          foregroundColor: Color(0xffe7eaed),
        ),
        cardColor: const Color(0xffe7eaed),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'DocMan'),
      // home: const DashBoardWidget(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const HomeWidget(),
        '/showcontainer': (BuildContext context) => const ShowContainers(),
        '/showimages': (BuildContext context) => const ShowImages(),
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return tabController;
//   }
// }
