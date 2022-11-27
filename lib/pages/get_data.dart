import 'package:http/http.dart' as http;

web(userCmd, ip) async {
  var url = await http.get(
    Uri.http("$ip", "/cgi-bin/cmdTestH.py", {"cmd": userCmd}),
  );
  // var response = url;
  // ignore: avoid_print
  print(url.body);
  // print(response.body.runtimeType);
  return url.body;
}
