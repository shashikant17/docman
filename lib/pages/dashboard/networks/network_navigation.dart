import 'package:flutter/material.dart';

import 'create_network.dart';
import 'inspect_network.dart';
import 'remove_network.dart';
import 'show_network.dart';

class DockerNetwork extends StatefulWidget {
  const DockerNetwork({super.key});

  @override
  State<DockerNetwork> createState() => _DockerNetworkState();
}

class _DockerNetworkState extends State<DockerNetwork> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ShowNetwork(),
    CreateNetwork(),
    RemoveNetwork(),
    InspectNetwork(),
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
        title: const Text('Docker Volumes'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: const Color(0xff4A6572),
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.wifi),
            label: 'Docker Networks',
            // backgroundColor: Colors.red,
            backgroundColor: Color(0xff4A6572),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create Volume',
            backgroundColor: Colors.green,
            // backgroundColor: Color(0xff4A6572),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Remove Volume',
            backgroundColor: Colors.red,
            // backgroundColor: Color(0xff4A6572),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            label: 'Inspect Volume',
            backgroundColor: Colors.purple,
            // backgroundColor: Color(0xff4A6572),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
