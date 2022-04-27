import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sion_inter/bloc/search_mahasiswa_bloc.dart';
import 'package:sion_inter/shared/shared.dart';

class FindMahasiswaPage extends StatefulWidget {
  const FindMahasiswaPage({Key? key}) : super(key: key);

  @override
  _FindMahasiswaPageState createState() => _FindMahasiswaPageState();
}

class _FindMahasiswaPageState extends State<FindMahasiswaPage> {
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
            context.read<SearchMahasiswaBloc>().add(TextChanged(text: text));
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
            hintText: "Enter student search term"),
      ),
    );
  }

  void _onClearTapped() {
    _textController.text = "";

    context.read<SearchMahasiswaBloc>().add(TextChanged(text: ""));
  }
}

class _SearchBody extends StatelessWidget {
  _SearchBody({Key? key}) : super(key: key);
  ExpandedTileController expandedTileController = ExpandedTileController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMahasiswaBloc, SearchMahasiswaState>(
      builder: (context, state) {
        if (state is SearchMahasiswaLoad) {
          return Center(
            child: SpinKitFadingCircle(color: kPrimaryColor),
          );
        }
        if (state is SearchMahasiswaFail) {
          return Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(state.error),
            ),
          );
        }
        if (state is SearchMahasiswaSuccess) {
          if (state.listOfMahasiswa.isEmpty) {
            return Container(
              margin: EdgeInsets.only(top: SizeConfig.blockVertical(4)),
              child: Text(
                "Not Found",
                style: blackTextStyle.copyWith(fontWeight: bold),
              ),
            );
          }

          return Column(children: [
            ExpandedTileList.builder(
                itemCount: state.listOfMahasiswa.length,
                itemBuilder: (context, index, expandedTileController) {
                  return ExpandedTile(
                      leading: CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        child: Icon(
                          Icons.person,
                          color: kWhiteColor,
                        ),
                      ),
                      title: Text("${state.listOfMahasiswa[index].nama}"),
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
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockHorizontal(8)),
                                      width: 100,
                                      child: Text("Name")),
                                  Flexible(
                                      child: Text(
                                          "${state.listOfMahasiswa[index].nama}",
                                          textAlign: TextAlign.start)),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockHorizontal(8)),
                                      width: 100,
                                      child: Text("ID")),
                                  Flexible(
                                      child: Text(
                                    "${state.listOfMahasiswa[index].nim}",
                                    textAlign: TextAlign.start,
                                  ))
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: SizeConfig.blockHorizontal(8)),
                                    width: 100,
                                    child: Text("Major"),
                                  ),
                                  Flexible(
                                      child: Text(
                                          "${state.listOfMahasiswa[index].prodi}"))
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.blockHorizontal(8)),
                                      width: 100,
                                      child: Text("Status")),
                                  Text("${state.listOfMahasiswa[index].status}")
                                ],
                              ),
                            ]),
                      ),
                      controller: expandedTileController);
                })
          ]);
        }
        return Container();
      },
    );
  }
}
