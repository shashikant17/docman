import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'server_details.dart';

class CmdOutput extends StatefulWidget {
  const CmdOutput({Key? key}) : super(key: key);

  @override
  CmdOutputState createState() => CmdOutputState();
}

class CmdOutputState extends State<CmdOutput> {
  late String userCmd;
  late var cmdOutput = "";
  web(userCmd, ip) async {
    var url = await http.get(
      Uri.http("$ip", "/cgi-bin/cmdTestH.py", {"cmd": userCmd}),
    );
    // print(url.body);
    // print(url.body.runtimeType);
    setState(() {
      cmdOutput = url.body;
      // print(cmdOutput);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text("Terminal"),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Command',
                  hintText: "Enter Command Here..",
                  filled: true,
                  hoverColor: Colors.blue.shade100,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Color(0xff4A6572),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Color(0xff4A6572),
                      width: 2.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    userCmd = value;
                  });
                },
                onSubmitted: (value) {
                  web(userCmd, serverIP);
                },
              ),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              scrollDirection: Axis.vertical,
              child: Card(
                elevation: 5,
                child: Center(
                  child: Text(
                    cmdOutput,
                    style: const TextStyle(
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
