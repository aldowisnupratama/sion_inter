import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sion_inter/cubit/biodata/biodata_cubit.dart';
import 'package:sion_inter/cubit/cubit.dart';

import '../../app_routes.dart';

void main() {
  runApp(SIONInterApp());
}

class SIONInterApp extends StatelessWidget {
  const SIONInterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => BiodataCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute().generateRoute,
      ),
    );
  }
}
