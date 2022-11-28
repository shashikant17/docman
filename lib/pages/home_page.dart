import 'package:docman/pages/appbar.dart';
import 'package:flutter/material.dart';

import 'dashboard/dashboard_attribute_list.dart';
import 'settings/setting_attribute_list.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedIndex = 0;

  static final List<dynamic> _widgetOptions = <dynamic>[
    const DashBoard(),
    const Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        leading: IconButton(
          icon: dockerLogo,
          onPressed: funcLaunchDockerURL,
        ),
        title: const Text(
          'DocMan',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/terminal');
            },
            icon: const Icon(Icons.keyboard_alt_outlined),
            tooltip: "Terminal",
          ),
          const IconButton(
            onPressed: funcLaunchGitHubURL,
            icon: Icon(Icons.code),
            tooltip: "GitHub",
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff4A6572),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
            // backgroundColor: Colors.purple
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            // backgroundColor: Colors.amber
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
