// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowContainer extends StatefulWidget {
  const ShowContainer({Key? key}) : super(key: key);

  @override
  ShowContainerState createState() => ShowContainerState();
}

class ShowContainerState extends State<ShowContainer> {
  late String userCmd = "docker ps -a";
  late var showContainer = "";
  web(userCmd) async {
    var url = await http.get(
      Uri.http("192.168.22.85", "/cgi-bin/cmdTestH.py", {"cmd": userCmd}),
    );
    // print(url.body);
    var response = url;
    // ignore: avoid_print
    print(response.body);
    // print(url.body.runtimeType);

    // setState(() {
    //   showContainer = url.body;
    //   // print(showContainer);
    // });
    setState(() {
      showContainer = url.body;
      // print(showContainer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Containers'),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: Card(
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: "Enter Command Here..",
                  ),
                  onChanged: (value) {
                    setState(() {
                      userCmd = value;
                    });
                  },
                  onSubmitted: (value) {
                    web(userCmd);
                  },
                ),
                elevation: 5,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: Card(
                child: Center(
                  child: Text(
                    showContainer,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                elevation: 5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.5),
            child: SizedBox(
              width: 700,
              child: FloatingActionButton.extended(
                  icon: const Icon(Icons.add),
                  backgroundColor: const Color(0xff030303),
                  onPressed: () {
                    // Navigator.pushNamed(context, '/launchcontainer');
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const LaunchContainer()));
                  },
                  label: const Text("Create a new container")),
            ),
          )
        ],
      ),
    );
  }
}
