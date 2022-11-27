// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../server_details.dart';
import 'pull_image.dart';

class ShowImages extends StatefulWidget {
  const ShowImages({Key? key}) : super(key: key);

  @override
  ShowImagesState createState() => ShowImagesState();
}

class ShowImagesState extends State<ShowImages> {
  // String serverIP = "";
  String userCmd = "docker images";
  late var showContainersOutput = "";

  web(userCmd, ip) async {
    var url = await http.get(
      Uri.http("$ip", "/cgi-bin/cmdTestH.py", {"cmd": userCmd}),
    );
    // print(url.body);
    // var response = url;
    // print(response.body);
    // print(url.body.runtimeType);
    setState(() {
      showContainersOutput = url.body;
    });
  }

  @override
  // ignore: must_call_super
  void initState() {
    web(userCmd, serverIP);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Docker Images'),
        actions: <Widget>[
          // PUSH Image - Working
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_upward),
            tooltip: "Push",
            padding: const EdgeInsets.all(5),
          ),
          // PULL Image - Complete
          const PullImage(),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: Card(
                child: Center(
                  child: Text(
                    showContainersOutput,
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
        ],
      ),
    );
  }
}
