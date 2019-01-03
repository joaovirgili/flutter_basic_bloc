import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class HomeController implements BlocBase {
  // passing context to the bloc
  final BuildContext context;
  HomeController(this.context);

  var _countController = BehaviorSubject<int>(seedValue: 0);

  // output count
  Stream<int> get outCounter => _countController.stream;
  //input count
  Sink<int> get inCounter => _countController.sink;

  increment() {
    inCounter.add(_countController.value + 1);
  }

  @override
  void dispose() {
    _countController.close();
  }
}
