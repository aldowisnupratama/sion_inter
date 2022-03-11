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
          context.read<SearchDosenBloc>().add(TextChanged(term: text));
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
              child: Text("Not Found"),
            );
          }
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
                      content: Container(),
                      controller: expandedTileController);
                })
          ]);
        }
        return Container();
      },
    );
  }
}
