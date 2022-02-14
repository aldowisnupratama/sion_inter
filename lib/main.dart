import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'package:sion_inter/cubit/cubit.dart';

import '../../app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
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
        BlocProvider(create: (context) => BiodataCubit()),
        BlocProvider(create: (context) => GpaCubit()),
        BlocProvider(create: (context) => FinalTestCubit()),
        BlocProvider(create: (context) => AnnouncementCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute().generateRoute,
      ),
    );
  }
}
