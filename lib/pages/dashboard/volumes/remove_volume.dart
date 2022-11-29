import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../server_details.dart';

class RemoveVolume extends StatefulWidget {
  const RemoveVolume({super.key});

  @override
  State<RemoveVolume> createState() => RemoveVolumeState();
}

class RemoveVolumeState extends State<RemoveVolume> {
  late String volumeName = "";

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
    print("Volume Name: $volumeName\n");
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
                    labelText: 'Volume Name',
                    hintText: "Enter Volume Name",
                    helperText: 'example: myVolume',
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
                      volumeName = value;
                    });
                  },
                ),
              ),
              SizedBox(
                // width: 500,
                child: FloatingActionButton.extended(
                    icon: const Icon(Icons.delete),
                    backgroundColor: Colors.red,
                    onPressed: () {
                      _printInputValues();
                      if (volumeName.isNotEmpty) {
                        userCmd = "docker volume rm $volumeName";

                        // ignore: avoid_print
                        print(userCmd);
                        web(userCmd, serverIP);

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Volume Removed')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Enter volume name correctly')));
                      }
                    },
                    label: const Text("Remove Volume")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
