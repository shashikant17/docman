import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

var dockerLogoUrl =
    'https://raw.githubusercontent.com/shashikant17/test_minor_project/main/lib/assets/icons/docker-48.jpg?token=GHSAT0AAAAAAB2U5GGUKKQHGIDNV3EQR3MUY3MLLZA';

var dockerLogo = Image.network(
  dockerLogoUrl,
);

var logo = Image.asset('assets/Docker-Logo-White.png');

final Uri dockerURL = Uri.parse('https://www.docker.com/');

Future<void> funcLaunchDockerURL() async {
  if (!await launchUrl(dockerURL)) {
    throw 'Could not launch $dockerURL';
  }
}

final Uri gitHubURL =
    Uri.parse('https://github.com/shashikant17/test_minor_project.git');

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
