
import 'package:adopttoutou/models/toutou_model.dart';
import 'package:flutter/material.dart';

class LovedToutouProvider with ChangeNotifier {
  final List<Toutou> _lovedToutous = [];

  List<Toutou> get lovedToutous => _lovedToutous;

  void addToutou(Toutou toutou) {
    if (!_lovedToutous.contains(toutou)) {
      _lovedToutous.add(toutou);
      notifyListeners();
    }
  }

  void removeToutou(Toutou toutou) {
    _lovedToutous.remove(toutou);
    notifyListeners();
  }
}
