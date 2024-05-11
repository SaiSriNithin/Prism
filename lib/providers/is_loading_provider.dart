import 'package:flutter/material.dart';

class IsLoadingProvider extends ChangeNotifier {
  bool isloading = false;

  changeStatus() {
    isloading = !isloading;
    notifyListeners();
  }
}
