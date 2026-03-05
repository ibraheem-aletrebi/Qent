import 'package:flutter/material.dart';
import 'package:quent/qent_app.dart';
import 'package:quent/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServicesLocator();
  runApp(const QentApp());
}
