import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sion_inter/shared/shared.dart';

class CostumeDownloader {
  Future downloader(context, String url, String filename) async {
    final status = await Permission.storage.request();
    final baseStorage = await getExternalStorageDirectory();
    if (status.isGranted) {
      Fluttertoast.showToast(
          msg: "Downloading",
          backgroundColor: kGreenColor,
          textColor: kWhiteColor,
          toastLength: Toast.LENGTH_LONG);
      final taskId = await FlutterDownloader.enqueue(
        fileName: filename,
        url: url,
        savedDir: baseStorage!.path,
        showNotification:
            true, // show download progress in status bar (for Android)
        openFileFromNotification:
            true, // click on notification to open downloaded file (for Android)
      );
    } else {
      Fluttertoast.showToast(
          msg: "Permission Denied",
          backgroundColor: kRedColor,
          textColor: kWhiteColor,
          toastLength: Toast.LENGTH_LONG);
    }
  }
}
