import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:new_prism/services/ip.dart';
import 'package:shared_preferences/shared_preferences.dart';

void loginUser(Map<String, dynamic> message) async {
  final SendPort sendPort = message['sendPort'];
  var isolateToken = message['isolateToken'];
  String type = message['type'];
  String username = message['username'];
  String password = message['password'];
  BackgroundIsolateBinaryMessenger.ensureInitialized(isolateToken);
  try {
    http.Response res = await http.post(
      Uri.parse('$ip/api/${type.toLowerCase()}/login'),
      body: jsonEncode({
        'UserName': username.toUpperCase(),
        'Password': password,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("onboarding", true);
      await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
      await prefs.setString('whoIsSignedIn', type);
      sendPort.send(res.statusCode);
    } else if (res.statusCode == 400) {
      sendPort.send(res.statusCode);
    } else {
      sendPort.send(res.statusCode);
    }
  } catch (e) {
    debugPrint(e.toString());
    sendPort.send("Error: $e");
  } finally {
    // Terminate the isolate after completing its task.
    Isolate.current.kill(priority: Isolate.immediate);
  }
}
