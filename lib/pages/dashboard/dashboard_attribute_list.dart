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
          leading: const Icon(Icons.computer),
          trailing: const Icon(Icons.arrow_forward_ios),
          contentPadding: const EdgeInsets.all(10),
          hoverColor: Colors.blue.shade100,
          iconColor: const Color(0xffb62551),
          onTap: () {
            Navigator.pushNamed(context, '/showcontainer');
          },
        ),
        const Divider(
          color: Colors.grey,
          height: 20,
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
        ListTile(
          title: const Text(
            "Images",
          ),
          subtitle: Text("4"),
          leading: const Icon(Icons.image),
          trailing: const Icon(Icons.arrow_forward_ios),
          contentPadding: const EdgeInsets.all(10),
          hoverColor: Colors.blue.shade100,
          iconColor: const Color(0xffb62551),
          onTap: () {
            Navigator.pushNamed(context, '/showimages');
          },
        ),
        const Divider(
          color: Colors.grey,
          height: 20,
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
        ListTile(
          title: const Text("Volumes"),
          subtitle: Text("2"),
          leading: const Icon(Icons.storage),
          trailing: const Icon(Icons.arrow_forward_ios),
          contentPadding: const EdgeInsets.all(10),
          hoverColor: Colors.blue.shade100,
          iconColor: const Color(0xffb62551),
          onTap: () {},
        ),
        const Divider(
          color: Colors.grey,
          height: 20,
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
        ListTile(
          title: const Text("Networks"),
          subtitle: Text("1"),
          leading: const Icon(Icons.network_check),
          trailing: const Icon(Icons.arrow_forward_ios),
          contentPadding: const EdgeInsets.all(10),
          hoverColor: Colors.blue.shade100,
          iconColor: const Color(0xffb62551),
          onTap: () {},
        ),
        const Divider(
          color: Colors.grey,
          height: 20,
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }
}
