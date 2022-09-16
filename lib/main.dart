import 'package:flutter/material.dart';
import 'package:myapp/feature/app/widget.dart';

void main() {
  runApp(AppWidget());
}

extension InitLog on Object {
  void initLog() => print('init $runtimeType');
}