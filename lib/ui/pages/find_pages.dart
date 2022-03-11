import 'package:flutter/material.dart';
import 'package:sion_inter/shared/shared.dart';
import 'package:sion_inter/ui/pages/find_dosen_page.dart';
import 'package:sion_inter/ui/pages/find_mahasiswa_page.dart';

class FindPages extends StatefulWidget {
  const FindPages({Key? key}) : super(key: key);

  @override
  State<FindPages> createState() => _FindPagesState();
}

class _FindPagesState extends State<FindPages> {
  // late TabController tabController;

  @override
  void initState() {
    // tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            "Search",
            style: whiteTextStyle.copyWith(
                fontSize: 22, fontWeight: semiBold, wordSpacing: 2),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: kWhiteColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: TabBar(tabs: [
            Tab(
              text: "Students",
            ),
            Tab(
              text: "Lecturers",
            )
          ]),
        ),
        body: TabBarView(
            // controller: tabController,
            children: [FindMahasiswaPage(), FindDosenPage()]),
      ),
    );
  }
}
