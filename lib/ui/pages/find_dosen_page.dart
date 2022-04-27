import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sion_inter/bloc/search_dosen_bloc.dart';

import 'package:sion_inter/shared/shared.dart';

class FindDosenPage extends StatefulWidget {
  const FindDosenPage({Key? key}) : super(key: key);

  @override
  _FindDosenPageState createState() => _FindDosenPageState();
}

class _FindDosenPageState extends State<FindDosenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [_search(), _SearchBody()],
      )),
    );
  }
}

class _search extends StatefulWidget {
  const _search({Key? key}) : super(key: key);

  @override
  __searchState createState() => __searchState();
}

class __searchState extends State<_search> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockVertical(1)),
      child: TextField(
        controller: _textController,
        autocorrect: false,
        onChanged: (text) {
          if (text.length > 3) {
            context.read<SearchDosenBloc>().add(TextChanged(term: text));
          }
        },
        decoration: InputDecoration(
            iconColor: kPrimaryColor,
            prefixIcon: const Icon(
              Icons.search,
            ),
            suffixIcon: GestureDetector(
              onTap: _onClearTapped,
              child: const Icon(Icons.clear),
            ),
            border: InputBorder.none,
            hintText: "Enter lecturer search term"),
      ),
    );
  }

  void _onClearTapped() {
    _textController.text = "";
    context.read<SearchDosenBloc>().add(TextChanged(term: ""));
  }
}

class _SearchBody extends StatelessWidget {
  _SearchBody({Key? key}) : super(key: key);
  ExpandedTileController expandedTileController = ExpandedTileController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchDosenBloc, SearchDosenState>(
      builder: (context, state) {
        if (state is SearchDosenLoad) {
          return Center(
            child: SpinKitFadingCircle(color: kPrimaryColor),
          );
        }
        if (state is SearchDosenFail) {
          return Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(state.error),
            ),
          );
        }
        if (state is SearchDosenSuccess) {
          if (state.listOfDosen.isEmpty) {
            return Container(
              margin: EdgeInsets.only(top: SizeConfig.blockVertical(4)),
              child: Text(
                "Not Found",
                style: blackTextStyle.copyWith(fontWeight: bold),
              ),
            );
          } else {
            return Column(children: [
              ExpandedTileList.builder(
                  itemCount: state.listOfDosen.length,
                  itemBuilder: (context, index, expandedTileController) {
                    return ExpandedTile(
                        leading: CircleAvatar(
                          backgroundColor: kPrimaryColor,
                          child: Icon(
                            Icons.person,
                            color: kWhiteColor,
                          ),
                        ),
                        title: Text("${state.listOfDosen[index].nama}"),
                        content: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: kWhiteColor),
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockVertical(0.5),
                              bottom: SizeConfig.blockVertical(0.5),
                              left: SizeConfig.blockHorizontal(1),
                              right: SizeConfig.blockHorizontal(1)),
                          padding: EdgeInsets.only(
                              top: SizeConfig.blockVertical(1),
                              bottom: SizeConfig.blockVertical(1),
                              left: SizeConfig.blockHorizontal(5),
                              right: SizeConfig.blockHorizontal(5)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        width: SizeConfig.blockHorizontal(40),
                                        child: Text("Name")),
                                    Flexible(
                                        child: Text(
                                      "${state.listOfDosen[index].nama}",
                                      textAlign: TextAlign.start,
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: SizeConfig.blockHorizontal(40),
                                        child: Text("Address")),
                                    Flexible(
                                        child: Text(
                                      "${state.listOfDosen[index].alamat}",
                                      textAlign: TextAlign.start,
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: SizeConfig.blockHorizontal(40),
                                        margin: EdgeInsets.only(
                                            right:
                                                SizeConfig.blockHorizontal(2)),
                                        child: Text("Phone Number")),
                                    Flexible(
                                        child: Text(
                                      "${state.listOfDosen[index].nomorHp}",
                                      textAlign: TextAlign.start,
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: SizeConfig.blockHorizontal(40),
                                        child: Text("Email")),
                                    Flexible(
                                        child: Text(
                                      "${state.listOfDosen[index].email}",
                                      textAlign: TextAlign.start,
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: SizeConfig.blockHorizontal(40),
                                        child: Text("Major")),
                                    Flexible(
                                        child: Text(
                                      "${state.listOfDosen[index].jurusan}",
                                      textAlign: TextAlign.start,
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: SizeConfig.blockHorizontal(40),
                                        child: Text("Almameter")),
                                    Flexible(
                                        child: Text(
                                      "${state.listOfDosen[index].almamater}",
                                      textAlign: TextAlign.start,
                                    ))
                                  ],
                                ),
                              ]),
                        ),
                        controller: expandedTileController);
                  })
            ]);
          }
        }
        return Container();
      },
    );
  }
}
