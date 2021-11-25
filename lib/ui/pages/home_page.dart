import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sion_inter/cubit/cubit.dart';
import 'package:sion_inter/shared/shared.dart';

class HomePage extends StatefulWidget {
  final ZoomDrawerController drawerController;

  const HomePage({Key? key, required this.drawerController}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [new IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        backgroundColor: kPrimaryColor,
        leading: InkWell(
            onTap: () => widget.drawerController.toggle!(),
            child: Icon(Icons.menu)),
      ),
      body: BlocBuilder<PageCubit, PageState>(
        builder: (context, state) {
          if (state is AnnouncementPageState) {
            return Container(
              child: Center(
                child: Text("announcement page"),
              ),
            );
          }
          if (state is SchedulePageState) {
            return Container(
              child: Center(
                child: Text("Schedule page"),
              ),
            );
          }
          return Container(
            child: Center(
              child: Text("zonk"),
            ),
          );
        },
      ),
    );
  }
}
