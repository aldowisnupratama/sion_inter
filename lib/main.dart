import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:sion_inter/bloc/search_dosen_bloc.dart';
import 'package:sion_inter/bloc/search_final_project_bloc.dart';
import 'package:sion_inter/bloc/search_mahasiswa_bloc.dart';
import 'package:sion_inter/cubit/biodata_dikti/biodata_dikti_cubit.dart';

import 'package:sion_inter/cubit/cubit.dart';
import 'package:sion_inter/cubit/reset_ms_teams/resetmsteams_cubit.dart';

import 'package:sion_inter/repository/find_dosen_cache.dart';
import 'package:sion_inter/repository/find_dosen_repository.dart';
import 'package:sion_inter/repository/find_mahasiswa_cache.dart';
import 'package:sion_inter/repository/find_mahasiswa_repository.dart';
import 'package:sion_inter/repository/repositories.dart';
import 'package:sion_inter/repository/search_final_project_repository.dart';
import 'package:sion_inter/services/services.dart';

import '../../app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(SIONInterApp()));
}

class SIONInterApp extends StatelessWidget {
  SIONInterApp({Key? key}) : super(key: key);

  FindMahasiswaRepostory findMahasiswaRepostory = FindMahasiswaRepostory(
      findMahasiswaCache: FindMahasiswaCache(), findService: FindService());
  FindDosenRepository findDosenRepository = FindDosenRepository(
      findService: FindService(), findDosenCache: FindDosenCache());
  SearchFinalProjectRepository searchFinalProjectRepository =
      SearchFinalProjectRepository(
          finalProjectService: FinalProjectService(),
          finalProjectCache: SearchFinalProjectCache());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => BiodataCubit()),
        BlocProvider(create: (context) => GpaCubit()),
        BlocProvider(create: (context) => FinalTestCubit()),
        BlocProvider(create: (context) => AnnouncementCubit()),
        BlocProvider(create: (context) => UpdatePasswordCubit()),
        BlocProvider(create: (context) => UpdateBiodataCubit()),
        BlocProvider(
            create: (context) => SearchMahasiswaBloc(
                findMahasiswaRepostory: findMahasiswaRepostory)),
        BlocProvider(
            create: (context) =>
                SearchDosenBloc(findDosenRepository: findDosenRepository)),
        BlocProvider(create: (context) => ScheduleCubit()),
        BlocProvider(create: (context) => LectureSelectorCubit()),
        BlocProvider(create: (context) => SelectedDayCubit()),
        BlocProvider(create: (context) => AttendanceCubit()),
        BlocProvider(create: (context) => ResetMsTeamsCubit()),
        BlocProvider(
            create: (context) => SearchFinalProjectBloc(
                searchFinalProjectRepository: searchFinalProjectRepository)),
        BlocProvider(create: (context) => FinalProjectTopicCubit()),
        BlocProvider(create: (context) => BiodataDiktiCubit()),
        BlocProvider(create: (context) => UpdateBiodataDiktiCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute().generateRoute,
      ),
    );
  }
}
