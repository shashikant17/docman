import 'package:flutter/material.dart';

import 'package:docman/pages/server_details.dart';
import 'package:http/http.dart' as http;

class RemoveContainer extends StatefulWidget {
  const RemoveContainer({super.key});

  @override
  State<RemoveContainer> createState() => RemoveContainerState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class RemoveContainerState extends State<RemoveContainer> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  late String containerID = "";
  late String containerName = "";

  String userCmd = "";
  late var showContainersOutput = "";

  web(userCmd, ip) async {
    var url = await http.get(
      Uri.http("$ip", "/cgi-bin/cmdTestH.py", {"cmd": userCmd}),
    );
    setState(() {
      showContainersOutput = url.body;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is removed from the widget tree.
  //   // This also removes the _printLatestValue listener.
  //   super.dispose();
  // }

  void _printInputValues() {
    // ignore: avoid_print
    print("Image Name: $containerID\n");
    // ignore: avoid_print
    print("Container Name: $containerName\n");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remove Container'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  onChanged: (text) {
                    // print('First text field: $text');
                    containerID = text;
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Container ID',
                    hintText: "Enter Container ID",
                    // helperText: 'help: you can also put initials of container ID',
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
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(30),
                    // ),
                    labelText: 'Container Name',
                    hintText: "Enter Container Name",
                    // helperText: 'example: mycontainer1',
                    filled: true,
                    hoverColor: Colors.blue.shade100,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        // color: Colors.blue.shade100,
                        color: Color(0xff4A6572),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        // color: Color.fromARGB(255, 114, 139, 250),
                        color: Color(0xff4A6572),
                        width: 2.0,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      containerName = value;
                    });
                  },
                  // onSubmitted: (value) {
                  //   // web(userCmd);
                  //   print(containerName);
                  // },
                ),
              ),
              SizedBox(
                // width: 500,
                child: FloatingActionButton.extended(
                    icon: const Icon(Icons.delete),
                    // backgroundColor: const Color(0xff344955),
                    backgroundColor: Colors.red.shade800,
                    onPressed: () {
                      _printInputValues();
                      if (containerName.isNotEmpty && containerID.isEmpty) {
                        userCmd = "docker rm --force $containerName";

                        web(userCmd, serverIP);

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Container Removed')));
                      }
                      if (containerName.isEmpty && containerID.isNotEmpty) {
                        userCmd = "docker rm --force $containerID";

                        web(userCmd, serverIP);

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Container Removed')));
                      }
                      if (containerName.isNotEmpty && containerID.isNotEmpty) {
                        userCmd = "docker rm --force $containerName";

                        web(userCmd, serverIP);

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Container Removed')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Enter details correctly')));
                      }
                    },
                    label: const Text("Remove Container")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
