import 'package:docman/pages/get_data.dart';
import 'package:docman/pages/server_details.dart';
import 'package:flutter/material.dart';

class PullImage extends StatelessWidget {
  const PullImage({super.key});

  @override
  Widget build(BuildContext context) {
    String userCmd = "";
    String imageName = "";
    return IconButton(
      onPressed: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Center(
              child: Text("Pull Image"),
            ),
            elevation: 10,
            buttonPadding: const EdgeInsets.all(10),
            contentPadding: const EdgeInsets.all(10),
            content: TextField(
              onChanged: (text) {
                imageName = text;
                // print(text);
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: 'Image Name',
                helperText: 'example: hello-world',
                // filled: true,
                // hoverColor: Colors.blue.shade100,
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
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (imageName.isNotEmpty) {
                    userCmd = "docker pull $imageName";
                    // print(userCmd);
                    Navigator.pop(context, 'Pull');
                    web(userCmd, serverIP);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Pulling image from Internet')));
                  } else {
                    // print(userCmd);
                    // web("date", serverIP);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please Enter Image Name')));
                    Navigator.pop(context, 'Pull');
                  }
                },
                child: const Text('Pull'),
              ),
            ],
          ),
        );
      },
      icon: const Icon(Icons.arrow_downward),
      tooltip: "Pull",
      padding: const EdgeInsets.all(5),
    );
  }
}
