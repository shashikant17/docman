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
          onTap: () {
            Navigator.pushNamed(context, '/cmd');
          },
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
