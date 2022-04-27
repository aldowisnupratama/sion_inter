import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sion_inter/bloc/search_final_project_bloc.dart';
import 'package:sion_inter/shared/shared.dart';

class SearchFinalProjectPage extends StatefulWidget {
  const SearchFinalProjectPage({Key? key}) : super(key: key);

  @override
  State<SearchFinalProjectPage> createState() => _SearchFinalProjectPageState();
}

class _SearchFinalProjectPageState extends State<SearchFinalProjectPage> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Seach Final Project Topics"),
      ),
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
            context.read<SearchFinalProjectBloc>().add(TextChanged(term: text));
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
    context.read<SearchFinalProjectBloc>().add(TextChanged(term: ""));
  }
}

class _SearchBody extends StatelessWidget {
  _SearchBody({Key? key}) : super(key: key);
  ExpandedTileController expandedTileController = ExpandedTileController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchFinalProjectBloc, SearchFinalProjectState>(
      builder: (context, state) {
        if (state is SearchFinalProjectLoad) {
          return Center(
            child: SpinKitFadingCircle(color: kPrimaryColor),
          );
        }
        if (state is SearchFinalProjectFail) {
          return Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(state.errorMessage),
            ),
          );
        }
        if (state is SearchFinalProjectSuccess) {
          if (state.listofFinalProject.isEmpty) {
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
                  itemCount: state.listofFinalProject.length,
                  itemBuilder: (context, index, expandedTileController) {
                    return ExpandedTile(
                        leading: CircleAvatar(
                          backgroundColor: kPrimaryColor,
                          child: Icon(
                            Icons.topic_rounded,
                            color: kWhiteColor,
                          ),
                        ),
                        title: Text(
                          "${state.listofFinalProject[index].judul}",
                          style: blackTextStyle,
                        ),
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
                              top: SizeConfig.blockVertical(3),
                              bottom: SizeConfig.blockVertical(3),
                              left: SizeConfig.blockHorizontal(8),
                              right: SizeConfig.blockHorizontal(8)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        width: SizeConfig.blockHorizontal(40),
                                        child: Text(
                                          "TOPIC",
                                          style: blackTextStyle,
                                        )),
                                    Flexible(
                                        child: Text(
                                      "${state.listofFinalProject[index].judul}",
                                      textAlign: TextAlign.start,
                                      style: blackTextStyle,
                                    )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: SizeConfig.blockHorizontal(40),
                                        child: Text(
                                          "ID",
                                          style: blackTextStyle,
                                        )),
                                    Flexible(
                                        child: Text(
                                      "${state.listofFinalProject[index].nim}",
                                      textAlign: TextAlign.start,
                                      style: blackTextStyle,
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
