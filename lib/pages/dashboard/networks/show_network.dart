import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../server_details.dart';

class ShowNetwork extends StatefulWidget {
  const ShowNetwork({Key? key}) : super(key: key);

  @override
  ShowNetworkState createState() => ShowNetworkState();
}

class ShowNetworkState extends State<ShowNetwork> {
  String userCmd = "docker network ls";
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
      appBar: AppBar(
        title: const Text('Docker Network'),
      ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Container(
                  // alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(2.5),
                  // width: 700,
                  child: SizedBox(
                    width: 700,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        // // Navigator.pushNamed(context, '/launchcontainer');
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const RemoveContainer(),
                        //   ),
                        // );
                      },
                      label: const Text("Remove Network"),
                      elevation: 5,
                      backgroundColor: Colors.red.shade800,
                      icon: const Icon(Icons.delete),
                      heroTag: "Remove Network",
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  // alignment: Alignment.centerRight,
                  padding: const EdgeInsets.all(2.5),
                  // width: 700,
                  child: SizedBox(
                    width: 700,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        // // Navigator.pushNamed(context, '/launchcontainer');
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const RemoveContainer(),
                        //   ),
                        // );
                      },
                      label: const Text("Create Network"),
                      elevation: 5,
                      backgroundColor: const Color(0xff4A6572),
                      icon: const Icon(Icons.add),
                      heroTag: "Create Network",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
