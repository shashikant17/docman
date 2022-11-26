import 'package:flutter/material.dart';

class LaunchContainer extends StatefulWidget {
  const LaunchContainer({super.key});

  @override
  State<LaunchContainer> createState() => LaunchContainerState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class LaunchContainerState extends State<LaunchContainer> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  late String imageName = "";
  late String containerName = "";

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
    print("Image Name: $imageName\n");
    // ignore: avoid_print
    print("Container Name: $containerName\n");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Launch New Container'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              // Input image name
              Container(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  onChanged: (text) {
                    // print('First text field: $text');
                    imageName = text;
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: 'Image Name',
                    hintText: "Enter Image Name",
                    helperText: 'example: ubuntu',
                    filled: true,
                    hoverColor: Colors.blue.shade100,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.blue.shade100,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 114, 139, 250),
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
                    helperText: 'example: mycontainer1',
                    filled: true,
                    hoverColor: Colors.blue.shade100,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.blue.shade100,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 114, 139, 250),
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
                    icon: const Icon(Icons.add),
                    backgroundColor: const Color(0xff344955),
                    onPressed: () {
                      _printInputValues();
                      if (containerName.isNotEmpty && imageName.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Container Launched')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Enter all details correctly')));
                      }
                    },
                    label: const Text("Launch Container")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
