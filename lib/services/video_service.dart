import 'dart:io';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

import '../core/helpers/log_helper.dart';

class VideoService {
  static Future<void> downloadVideo(String filePath) async {
    Dio dio = Dio();
    try {
      var dir = await getApplicationDocumentsDirectory();
      final File file = File(filePath);
      final String fileName = basename(file.path);
      printLog("path ${dir.path}, filename ");
      await dio.download(filePath, "${dir.path}/$fileName",
          onReceiveProgress: (rec, total) {
        // print("filename: $fileName,Rec: $rec , Total: $total");
      });
    } catch (e) {
      printLog('error $e');
    }
  }

  static Future<String> getVideoPath(String filePath) async {
    var dir = await getApplicationDocumentsDirectory();
    final File file = File(filePath);
    return "${dir.path}/${basename(file.path)}";
  }
}
