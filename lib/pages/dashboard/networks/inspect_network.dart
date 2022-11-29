import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../server_details.dart';

class InspectNetwork extends StatefulWidget {
  const InspectNetwork({super.key});

  @override
  State<InspectNetwork> createState() => InspectNetworkState();
}

class InspectNetworkState extends State<InspectNetwork> {
  late String networkName = "";

  String userCmd = "";
  late var cmdOutput = "";

  web(userCmd, ip) async {
    var url = await http.get(
      Uri.http("$ip", "/cgi-bin/cmdTestH.py", {"cmd": userCmd}),
    );
    setState(() {
      cmdOutput = url.body;
      // ignore: avoid_print
      print(cmdOutput);
    });
  }

  void _printInputValues() {
    // ignore: avoid_print
    print("Network Name: $networkName\n");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Network Name',
                    hintText: "Enter Network Name",
                    helperText: 'example: myNetwork',
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
                      networkName = value;
                    });
                  },
                  onSubmitted: (value) {
                    _printInputValues();
                    if (networkName.isNotEmpty) {
                      userCmd = "docker network inspect $networkName";

                      // ignore: avoid_print
                      print(userCmd);
                      web(userCmd, serverIP);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Enter network name correctly')));
                    }
                  },
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(2.5),
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
        ),
      ),
    );
  }
}
