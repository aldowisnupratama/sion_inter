import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:sion_inter/model/announcement_model.dart';
import 'package:sion_inter/shared/shared.dart';
import 'package:sion_inter/ui/widgets/costume_button.dart';
import 'package:sion_inter/ui/widgets/dowloader_widget.dart';

class AnnoucementPage extends StatefulWidget {
  List<Pengumuman>? listOfPengumuman;
  AnnoucementPage({Key? key, required this.listOfPengumuman}) : super(key: key);

  @override
  State<AnnoucementPage> createState() => _AnnoucementPageState();
}

class _AnnoucementPageState extends State<AnnoucementPage> {
  late DecorationImage image;
  late ExpandedTileController controller;

  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    image = DecorationImage(image: AssetImage("assets/images/stikom_home.png"));
    controller = ExpandedTileController();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState(() {});
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image.image, context);
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              padding: EdgeInsets.only(
                  top: SizeConfig.blockVertical(2),
                  bottom: SizeConfig.blockVertical(2),
                  left: SizeConfig.blockHorizontal(6),
                  right: SizeConfig.blockHorizontal(6)),
              child: Container(
                width: SizeConfig.blockHorizontal(70),
                height: SizeConfig.blockVertical(30),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/itb_putih.png"))),
                padding: EdgeInsets.only(
                    left: SizeConfig.blockHorizontal(10),
                    right: SizeConfig.blockHorizontal(10),
                    top: SizeConfig.blockVertical(3),
                    bottom: SizeConfig.blockVertical(5)),
              ),
            ),
          ],
        ),
      );
    }

    Widget prioritas() {
      var a = [];
      for (int i = 0; i < widget.listOfPengumuman!.length; i++) {
        if (widget.listOfPengumuman![i].prioritas == "1") {
          a.add(widget.listOfPengumuman![i]);
        }
      }

      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: kWhiteColor),
        margin: EdgeInsets.only(
            bottom: SizeConfig.blockVertical(4),
            top: SizeConfig.blockVertical(4),
            left: SizeConfig.blockHorizontal(2),
            right: SizeConfig.blockHorizontal(2)),
        padding: EdgeInsets.only(
            top: SizeConfig.blockVertical(3.5),
            bottom: SizeConfig.blockVertical(5),
            left: SizeConfig.blockHorizontal(5),
            right: SizeConfig.blockHorizontal(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: SizeConfig.blockVertical(2)),
              child: Text(
                "Priority Announcement",
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
              ),
            ),
            ExpandedTileList.builder(
                itemCount: a.length,
                itemBuilder: (context, index, controller) {
                  return ExpandedTile(
                    content: Container(
                      child: Column(
                        children: [
                          Container(
                              child: (!a[index].pengumuman.isEmpty
                                  ? Text(
                                      "${a[index].pengumuman}",
                                      style: blackTextStyle,
                                    )
                                  : Text(
                                      "There is no content in this announcement",
                                      style: blackTextStyle,
                                    ))),
                          SizedBox(
                            height: SizeConfig.blockVertical(2),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: (!a[index].dirUpload.isEmpty
                                ? Container(
                                    child: CostumeButton(
                                      buttonName: Text(
                                        "Download",
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: bold, fontSize: 13),
                                      ),
                                      width: SizeConfig.blockHorizontal(30),
                                      height: SizeConfig.blockVertical(5),
                                      onPressed: () {
                                        CostumeDownloader().downloader(
                                            context,
                                            "https://sion.stikom-bali.ac.id/${a[index].dirUpload}",
                                            "${a[index].fileName}");
                                      },
                                      color: kRedColor,
                                    ),
                                  )
                                : null),
                          )
                        ],
                      ),
                    ),
                    leading: Icon(
                      Icons.announcement,
                      color: kRedColor,
                    ),
                    title: Text(
                      "${a[index].judul}",
                      style: blackTextStyle.copyWith(fontSize: 14),
                    ),
                    controller: controller,
                  );
                })
          ],
        ),
      );
    }

    Widget nonPrioritas() {
      var a = [];
      for (int i = 0; i < widget.listOfPengumuman!.length; i++) {
        if (widget.listOfPengumuman![i].prioritas == "0") {
          a.add(widget.listOfPengumuman![i]);
        }
      }

      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: kWhiteColor),
        margin: EdgeInsets.only(
            bottom: SizeConfig.blockVertical(4),
            top: SizeConfig.blockVertical(4),
            left: SizeConfig.blockHorizontal(2),
            right: SizeConfig.blockHorizontal(2)),
        padding: EdgeInsets.only(
            top: SizeConfig.blockVertical(3.5),
            bottom: SizeConfig.blockVertical(5),
            left: SizeConfig.blockHorizontal(5),
            right: SizeConfig.blockHorizontal(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: SizeConfig.blockVertical(2)),
              child: Text(
                "Non-Priority Announcement",
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
              ),
            ),
            ExpandedTileList.builder(
                itemCount: a.length,
                itemBuilder: (context, index, controller) {
                  return ExpandedTile(
                    content: Container(
                      child: Column(
                        children: [
                          Container(
                              child: (!a[index].pengumuman.isEmpty
                                  ? Text(
                                      "${a[index].pengumuman}",
                                      style: blackTextStyle,
                                    )
                                  : Text(
                                      "There is no content in this announcement",
                                      style: blackTextStyle,
                                    ))),
                          SizedBox(
                            height: SizeConfig.blockVertical(2),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: (!a[index].dirUpload.isEmpty
                                ? Container(
                                    child: CostumeButton(
                                      buttonName: Text(
                                        "Download",
                                        style: whiteTextStyle.copyWith(
                                            fontWeight: bold, fontSize: 13),
                                      ),
                                      width: SizeConfig.blockHorizontal(30),
                                      height: SizeConfig.blockVertical(5),
                                      onPressed: () {
                                        CostumeDownloader().downloader(
                                            context,
                                            "https://sion.stikom-bali.ac.id/${a[index].dirUpload}",
                                            "${a[index].fileName}");
                                      },
                                      color: kPrimaryColor,
                                    ),
                                  )
                                : null),
                          )
                        ],
                      ),
                    ),
                    leading: Icon(
                      Icons.announcement,
                      color: kPrimaryColor,
                    ),
                    title: Text(
                      "${a[index].judul}",
                      style: blackTextStyle.copyWith(fontSize: 14),
                    ),
                    controller: controller,
                  );
                })
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Container(
        color: kPrimaryColor,
        child: Column(
          children: [header(), prioritas(), nonPrioritas()],
        ),
      ),
    );
  }
}
