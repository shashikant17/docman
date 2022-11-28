import 'package:flutter/material.dart';

import 'pull_image.dart';
import 'push_image.dart';
import 'remove_image.dart';
import 'show_image.dart';

class DockerImage extends StatefulWidget {
  const DockerImage({super.key});

  @override
  State<DockerImage> createState() => _DockerImageState();
}

class _DockerImageState extends State<DockerImage> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ShowImage(),
    PullImage(),
    PushImage(),
    RemoveImage(),
    /*
    Text(
      'Index 0: Show Image',
      style: optionStyle,
    ),
    Text(
      'Index 1: Pull Image',
      style: optionStyle,
    ),
    Text(
      'Index 2: Push Image',
      style: optionStyle,
    ),
    Text(
      'Index 3: Remove Image',
      style: optionStyle,
    ),
    */
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
        title: const Text('Docker Image'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Docker Images',
            // backgroundColor: Colors.red,
            backgroundColor: Color(0xff4A6572),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_downward),
            label: 'Pull Image',
            backgroundColor: Colors.green,
            // backgroundColor: Color(0xff4A6572),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_upward),
            label: 'Push Image',
            backgroundColor: Colors.purple,
            // backgroundColor: Color(0xff4A6572),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Remove Image',
            backgroundColor: Colors.red,
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
