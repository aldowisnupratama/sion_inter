import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import '../ui.dart';

class BiodataDiktiPage extends StatefulWidget {
  const BiodataDiktiPage({Key? key}) : super(key: key);

  @override
  State<BiodataDiktiPage> createState() => _BiodataDiktiPageState();
}

class _BiodataDiktiPageState extends State<BiodataDiktiPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            "DIKTI",
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
              text: "Dikti",
            ),
            Tab(
              text: "Update",
            )
          ]),
        ),
        body: TabBarView(
            // controller: tabController,
            children: [GetBiodataPages(), UpdateBiodataDikti()]),
      ),
    );
  }
}
