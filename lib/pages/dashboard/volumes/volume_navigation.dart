import 'package:docman/pages/dashboard/volumes/show_volumes.dart';
import 'package:flutter/material.dart';

import 'create_volume.dart';
import 'inspect_volume.dart';
import 'remove_volume.dart';

class DockerVolume extends StatefulWidget {
  const DockerVolume({super.key});

  @override
  State<DockerVolume> createState() => _DockerVolumeState();
}

class _DockerVolumeState extends State<DockerVolume> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ShowVolume(),
    CreateVolume(),
    RemoveVolume(),
    InspectVolume(),
    // Text(
    //   'Index 0: Show Volume',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Index 1: Create Volume',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Index 2: Remove Volume',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Index 3: prune Volume',
    //   style: optionStyle,
    // ),
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
            icon: Icon(Icons.storage),
            label: 'Docker Volume',
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
