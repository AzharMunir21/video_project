import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_project/Model/video_controller.dart';

import '../main.dart';

List videoList = [];

class VideoController extends GetxController {
  Future<VideoModel> getRequest() async {
    var prefs = await SharedPreferences.getInstance();
    //replace your restFull API here.
    String url = "https://aloexpo.co.uk/api/kiosk_data/GRXP001";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);

      videoList = [];

      print(responseData['data']['subscriptions'][0]['videos'].length);

      videoList = responseData['data']['subscriptions'][0]['videos'];
      print(videoList);
      prefs.setString('categoriesList', json.encode(videoList));
      videoList = jsonDecode(prefs.getString('categoriesList') ?? '[]');
      for (int i = 0; i <= videoList.length - 1; i++) {
        downloadFile(
          url: '${videoList[i]['path']}',
          index: i,
        );
      }
    }
    return VideoModel();
  }

  Future downloadFile({required String url, required int index}) async {
    var prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    final urlPath = "${videoList[0]['path']}";
    bool downloading = false;
    var progressString = "";
    try {
      var dir = await getApplicationDocumentsDirectory();
      await dio.download(
        url,
        '${dir.path}/video/video$index',
      );
      newList.add(dir.path);
      prefs.setString('List1', json.encode(newList));
      videoList = jsonDecode(prefs.getString('List1') ?? '[]');
    } catch (e) {
      print(e);
    }
    print("Download completed");
  }
}
