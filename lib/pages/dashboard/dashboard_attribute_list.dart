// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(5),
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        ListTile(
          title: const Text("Containers"),
          subtitle: Text("5"),
          leading: Icon(Icons.computer),
          trailing: Icon(Icons.arrow_forward_ios),
          contentPadding: EdgeInsets.all(10),
          onTap: () {},
        ),
        ListTile(
          title: Text("Images"),
          subtitle: Text("4"),
          leading: Icon(Icons.image),
          trailing: Icon(Icons.arrow_forward_ios),
          contentPadding: EdgeInsets.all(10),
          onTap: () {},
        ),
        ListTile(
          title: Text("Volumes"),
          subtitle: Text("2"),
          leading: Icon(Icons.storage),
          trailing: Icon(Icons.arrow_forward_ios),
          contentPadding: EdgeInsets.all(10),
          onTap: () {},
        ),
        ListTile(
          title: Text("Networks"),
          subtitle: Text("1"),
          leading: Icon(Icons.network_check),
          trailing: Icon(Icons.arrow_forward_ios),
          contentPadding: EdgeInsets.all(10),
          onTap: () {},
        ),
      ],
    );
  }
}

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
