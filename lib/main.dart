import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neversitup/app/my_app.dart';
import 'package:neversitup/app/observers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(observers: [Observers()], child: const MyApp()));
}
