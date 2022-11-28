import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../server_details.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard> {
  var userCmdList = [
    "docker ps -a | wc -l",
    "docker images | wc -l",
    "docker volume ls | wc -l",
    "docker network ls | wc -l"
  ];
  // late var cmdOutput = "";

  var outputList = ["1", "1", "1", "1"];
  web(userCmdList, ip) async {
    for (int i = 0; i <= 3; i++) {
      String userCmd = userCmdList[i];
      var url = await http.get(
        Uri.http("$ip", "/cgi-bin/cmdTestH.py", {"cmd": userCmd}),
      );

      setState(() {
        outputList[i] = url.body;
      });
    }
  }

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is removed from the widget tree.
  //   // This also removes the _printLatestValue listener.
  //   super.dispose();
  // }

  @override
  // ignore: must_call_super
  void initState() {
    web(userCmdList, serverIP);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      /*appBar: AppBar(
        title: const Text('Containers'),
      ),*/
      body: ListView(
        padding: const EdgeInsets.all(5),
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          ListTile(
            title: const Text("Containers"),
            subtitle: Text("${int.parse(outputList[0]) - 1}"),
            leading: const Icon(Icons.computer),
            trailing: const Icon(Icons.arrow_forward_ios),
            contentPadding: const EdgeInsets.all(10),
            hoverColor: Colors.blue.shade100,
            iconColor: const Color(0xffb62551),
            onTap: () {
              Navigator.pushNamed(context, '/containers');
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
            subtitle: Text("${int.parse(outputList[1]) - 1}"),
            leading: const Icon(Icons.image),
            trailing: const Icon(Icons.arrow_forward_ios),
            contentPadding: const EdgeInsets.all(10),
            hoverColor: Colors.blue.shade100,
            iconColor: const Color(0xffb62551),
            onTap: () {
              Navigator.pushNamed(context, '/images');
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
            subtitle: Text("${int.parse(outputList[2]) - 1}"),
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
            subtitle: Text("${int.parse(outputList[3]) - 1}"),
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
      ),
    );
  }
}

/*

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
            Navigator.pushNamed(context, '/containers');
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
            Navigator.pushNamed(context, '/images');
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
*/