import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

// var dockerLogoUrl =
//     'https://raw.githubusercontent.com/shashikant17/test_minor_project/main/lib/assets/icons/docker-48.jpg?token=GHSAT0AAAAAAB2U5GGUKKQHGIDNV3EQR3MUY3MLLZA';

// final dlogo = Image.network(
//   dockerLogoUrl,
// );

var dockerLogo = const Image(
  image: AssetImage('assets/docker-50-light.png'),
  fit: BoxFit.scaleDown,
);

// final Uri dockerURL = Uri.parse('https://www.docker.com/');
final Uri dockerURL = Uri.parse('https://hub.docker.com/search?q=');

Future<void> funcLaunchDockerURL() async {
  if (!await launchUrl(dockerURL)) {
    throw 'Could not launch $dockerURL';
  }
}

final Uri gitHubURL = Uri.parse('https://github.com/shashikant17/DocMan.git');

Future<void> funcLaunchGitHubURL() async {
  if (!await launchUrl(gitHubURL)) {
    throw 'Could not launch $gitHubURL';
  }
}

var appbar = AppBar(
  leading: IconButton(
    icon: dockerLogo,
    onPressed: funcLaunchDockerURL,
  ),
  bottom: const TabBar(
    tabs: [
      Tab(text: "Dashboard"),
      Tab(text: "Settings"),
    ],
  ),
  title: const Text(
    'DocMan',
    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
  ),
  actions: const <Widget>[
    IconButton(
      onPressed: funcLaunchGitHubURL,
      icon: Icon(Icons.code),
    ),
  ],
);

var appbarNavigation = AppBar(
  leading: IconButton(
    icon: dockerLogo,
    onPressed: funcLaunchDockerURL,
  ),
  title: const Text(
    'DocMan',
    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
  ),
  actions: <Widget>[
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.code),
    ),
    const IconButton(
      onPressed: funcLaunchGitHubURL,
      icon: Icon(Icons.keyboard_alt_outlined),
    ),
  ],
);
