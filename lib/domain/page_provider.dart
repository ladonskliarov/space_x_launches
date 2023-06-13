import 'package:flutter/material.dart';

///Class that makes it easy to get the page number from anywhere
class PageNumberProvider extends ChangeNotifier {
  ///Page number
  int pageNumber = 0;
  ///Function of changing the page number
  void changePage(int value){
    pageNumber = value;
    notifyListeners();
  }
}
