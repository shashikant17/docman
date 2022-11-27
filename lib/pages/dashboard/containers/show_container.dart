// ignore_for_file: sort_child_properties_last

import 'package:docman/pages/dashboard/containers/remove_container.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../server_details.dart';
import 'launch_container.dart';

class ShowContainers extends StatefulWidget {
  const ShowContainers({Key? key}) : super(key: key);

  @override
  ShowContainersState createState() => ShowContainersState();
}

class ShowContainersState extends State<ShowContainers> {
  // String serverIP = "192.168.151.85";
  String userCmd = "docker ps -a";
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
        title: const Text('Containers'),
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
          Row(
            children: [
              Flexible(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(2.5),
                  width: 700,
                  child: SizedBox(
                    width: 700,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RemoveContainer(),
                          ),
                        );
                      },
                      label: const Text("Remove container"),
                      elevation: 5,
                      backgroundColor: Colors.red.shade800,
                      icon: const Icon(Icons.delete),
                      heroTag: "remove container",
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.all(2.5),
                  width: 1000,
                  child: SizedBox(
                    width: 700,
                    child: FloatingActionButton.extended(
                      icon: const Icon(Icons.add),
                      // backgroundColor: const Color(0xff030303),
                      backgroundColor: const Color(0xff344955),
                      onPressed: () {
                        // Navigator.pushNamed(context, '/launchcontainer');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LaunchContainer(),
                          ),
                        );
                      },
                      label: const Text("Create a new container"),
                      heroTag: "create container",
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Padding(
          //   padding: const EdgeInsets.all(2.5),
          //   child: SizedBox(
          //     width: 700,
          //     child: FloatingActionButton.extended(
          //         icon: const Icon(Icons.add),
          //         // backgroundColor: const Color(0xff030303),
          //         backgroundColor: const Color(0xff344955),
          //         onPressed: () {
          //           // Navigator.pushNamed(context, '/launchcontainer');
          //           Navigator.pushReplacement(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const LaunchContainer()));
          //         },
          //         label: const Text("Create a new container")),
          //   ),
          // )
        ],
      ),
    );
  }
}
