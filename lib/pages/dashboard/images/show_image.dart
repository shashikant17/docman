import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../server_details.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({Key? key}) : super(key: key);

  @override
  ShowImageState createState() => ShowImageState();
}

class ShowImageState extends State<ShowImage> {
  // String serverIP = "";
  String userCmd = "docker images";
  late var cmdOutput = "";

  web(userCmd, ip) async {
    var url = await http.get(
      Uri.http("$ip", "/cgi-bin/cmdTestH.py", {"cmd": userCmd}),
    );
    // print(url.body);
    // var response = url;
    // print(response.body);
    // print(url.body.runtimeType);
    setState(() {
      cmdOutput = url.body;
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
      /*appBar: AppBar(
        title: const Text('Docker Images'),
        actions: const <Widget>[
          // PUSH Image - Working
          PushImage(),
          /*IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_upward),
            tooltip: "Push",
            padding: const EdgeInsets.all(5),
          ),*/

          // PULL Image - Complete
          PullImage(),
        ],
      ),*/
      body: Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: Card(
                elevation: 5,
                child: Center(
                  child: Text(
                    cmdOutput,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
