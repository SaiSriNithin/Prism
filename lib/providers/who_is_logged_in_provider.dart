import 'package:flutter/material.dart';

class WhoIsLoggedIn extends ChangeNotifier {
  String isSignedIn = "";
  changeStatus(String x) {
    isSignedIn = x;
  }
}
