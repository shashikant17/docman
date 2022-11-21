// ignore_for_file: sort_child_properties_last

import 'package:docman/pages/appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CmdOutput extends StatefulWidget {
  const CmdOutput({Key? key}) : super(key: key);

  @override
  CmdOutputState createState() => CmdOutputState();
}

class CmdOutputState extends State<CmdOutput> {
  late String userCmd;
  late var cmdoutput = "";
  web(userCmd) async {
    var url = await http.get(
      Uri.http("192.168.6.85", "/cgi-bin/cmdTestH.py", {"cmd": userCmd}),
    );
    // print(url.body);
    var response = url;
    print(response.body);
    print(url.body.runtimeType);

    setState(() {
      cmdoutput = url.body;
      // print(cmdoutput);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: appbarNavigation,
      body: Column(
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Center(
                  child: Text(
                    cmdoutput,
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
