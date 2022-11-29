import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../server_details.dart';

class ShowVolume extends StatefulWidget {
  const ShowVolume({Key? key}) : super(key: key);

  @override
  ShowVolumeState createState() => ShowVolumeState();
}

class ShowVolumeState extends State<ShowVolume> {
  String userCmd = "docker volume ls";
  late var cmdOutput = "";

  web(userCmd, ip) async {
    var url = await http.get(
      Uri.http("$ip", "/cgi-bin/cmdTestH.py", {"cmd": userCmd}),
    );
    // print(url.body);
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
      body: Column(
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(2.5),
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
