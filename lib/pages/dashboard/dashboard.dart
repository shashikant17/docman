import 'package:flutter/material.dart';

var url =
    'data:image/png;base64,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';

final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

// ignore: non_constant_identifier_names
var docker_options = Container(
  width: double.infinity,
  height: double.infinity,
  color: Colors.amber,
  child: Column(
    children: <Widget>[
      // Image.network(url),
      const Text("hello"),
      const Text("hii"),
      ElevatedButton(
        style: style,
        onPressed: funcShowDockerContainer,
        child: const Text('Docker Containers'),
      ),
      ElevatedButton(
        style: style,
        onPressed: () {},
        child: const Text('Docker Images'),
      ),
      ElevatedButton(
        style: style,
        onPressed: () {},
        child: const Text('Docker Network'),
      ),
      const Text("hii"),
    ],
  ),
);

void funcShowDockerContainer() {
  // ignore: avoid_print
  print("showing docker container");
}
