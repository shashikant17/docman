import 'package:flutter/material.dart';

import 'launch_container.dart';
import 'remove_container.dart';
import 'show_container.dart';
import 'start_container.dart';
import 'stop_container.dart';

class DockerContainer extends StatefulWidget {
  const DockerContainer({super.key});

  @override
  State<DockerContainer> createState() => _DockerContainerState();
}

class _DockerContainerState extends State<DockerContainer> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ShowContainers(),
    LaunchContainer(),
    RemoveContainer(),
    StartContainer(),
    StopContainer(),
    // Text(
    //   'Index 0: Show Containers',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Index 1: Create Container',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Index 2: Remove Container',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Index 3: Start Container',
    //   style: optionStyle,
    // ),
    // Text(
    //   'Index 4: Stop Container',
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
        title: const Text('Docker Container'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: 'Show Containers',
            // backgroundColor: Colors.red,
            backgroundColor: Color(0xff4A6572),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create Container',
            backgroundColor: Colors.green,
            // backgroundColor: Color(0xff4A6572),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Remove Container',
            backgroundColor: Colors.red,
            // backgroundColor: Color(0xff4A6572),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.start),
            label: 'Start Container',
            backgroundColor: Colors.purple,
            // backgroundColor: Color(0xff4A6572),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stop),
            label: 'Stop Container',
            backgroundColor: Colors.orange,
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
