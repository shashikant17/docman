// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(5),
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: Text("RedHat-Host"),
              subtitle: Text("http://192.168.109.85/cgi-bin/"),
              leading: Icon(Icons.miscellaneous_services_rounded),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              contentPadding: EdgeInsets.all(10),
              // onTap: () {},
            ),
          ),
          ListTile(
            title: Text("Ubuntu-Host"),
            subtitle: Text("http://192.168.109.85/cgi-bin/"),
            leading: Icon(Icons.miscellaneous_services_rounded),
            trailing:
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            contentPadding: EdgeInsets.all(10),
            // onTap: () {},
          ),
          FloatingActionButton.extended(
              icon: const Icon(Icons.add),
              backgroundColor: const Color(0xff030303),
              onPressed: () {},
              label: const Text("Add a New Host")),
        ]);
  }
}
