import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_routes.dart';

void main() {
  runApp(SIONInterApp());
}

class SIONInterApp extends StatelessWidget {
  const SIONInterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute().generateRoute,
    );
  }
}
