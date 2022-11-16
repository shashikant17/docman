// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

var dashboardAttributeList = ListView(
  padding: const EdgeInsets.all(5),
  physics: const NeverScrollableScrollPhysics(),
  children: [
    ListTile(
      title: const Text("Containers"),
      subtitle: Text("3"),
      leading: const Icon(Icons.computer),
      trailing: const Icon(Icons.arrow_forward_ios),
      contentPadding: EdgeInsets.all(10),
      onTap: () {},
    ),
    ListTile(
      title: const Text("Images"),
      subtitle: Text("4"),
      leading: const Icon(Icons.image),
      trailing: const Icon(Icons.arrow_forward_ios),
      contentPadding: EdgeInsets.all(10),
      onTap: () {},
    ),
    ListTile(
      title: const Text("Volumes"),
      subtitle: Text("2"),
      leading: const Icon(Icons.storage),
      trailing: const Icon(Icons.arrow_forward_ios),
      contentPadding: EdgeInsets.all(10),
      onTap: () {},
    ),
    ListTile(
      title: const Text("Networks"),
      subtitle: Text("1"),
      leading: const Icon(Icons.network_check),
      trailing: const Icon(Icons.arrow_forward_ios),
      contentPadding: EdgeInsets.all(10),
      onTap: () {},
    ),
  ],
);
