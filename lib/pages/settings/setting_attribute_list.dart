// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

var settingAttributeList = ListView(
    padding: const EdgeInsets.all(5),
    physics: const NeverScrollableScrollPhysics(),
    children: [
      ListTile(
        title: Text("RedHat-Host"),
        subtitle: Text("http://192.168.109.85/cgi-bin/"),
        leading: const Icon(Icons.miscellaneous_services_rounded),
        trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        contentPadding: EdgeInsets.all(10),
        // onTap: () {},
      ),
      ListTile(
        title: Text("Ubuntu-Host"),
        subtitle: Text("http://192.168.109.85/cgi-bin/"),
        leading: const Icon(Icons.miscellaneous_services_rounded),
        trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        contentPadding: EdgeInsets.all(10),
        // onTap: () {},
      ),
    ]);
