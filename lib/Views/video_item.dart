import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';
import 'package:video_project/Views/video_view.dart';

class VideoMaped extends StatefulWidget {
  int index=0;
  final String url;

   VideoMaped({Key? key,  required this.url,  required this.index}) : super(key: key);

  @override
  State<VideoMaped> createState() => _VideoMapedState();
}

class _VideoMapedState extends State<VideoMaped> {
  VideoPlayerController? _controller;


  @override
  void initState() {

    super.initState();

    initializePlayer(widget.url);
  }
  timer(){
    print('helooooooooooooooooooooooooooooooooooooooo');
    print('helooooooooooooooooooooooooooooooooooooooo');
    print(_controller!.value.duration.inSeconds);
    print('helooooooooooooooooooooooooooooooooooooooo');
    print('helooooooooooooooooooooooooooooooooooooooo');

     Timer(Duration(seconds: _controller!.value.duration.inSeconds), () {

       print('helooooooooooooooooooooooooooooooooooooooo');
       print('helooooooooooooooooooooooooooooooooooooooo');
       print(_controller!.value.duration.inSeconds);
       print('helooooooooooooooooooooooooooooooooooooooo');
       print('helooooooooooooooooooooooooooooooooooooooo');
       if (widget.index !=3) {
         widget.index ++;

       } else {
         widget.index = 0;
       }


       Get.offAll(() => VideoView(index: widget.index, ),duration: const Duration(seconds: 3), //duration of transitions, default 1 sec
           transition: Transition.circularReveal);
     });

  }
  void initializePlayer(String url) async {

    final fileInfo = await checkCacheFor(url);
    if (fileInfo == null) {
      _controller = VideoPlayerController.network(url);
      _controller!.initialize().then((value) {
        cachedForUrl(url);
        setState(() {
          _controller!.play();
          print('helooooooooooooooooooooooooooooooooooooooo');
          print('helooooooooooooooooooooooooooooooooooooooo');
        print(_controller!.value.duration.inSeconds);
          print('helooooooooooooooooooooooooooooooooooooooo');
          print('helooooooooooooooooooooooooooooooooooooooo');
          timer();



        });
      });
    } else {
      final file = fileInfo.file;
      _controller = VideoPlayerController.file(file);
      _controller!.initialize().then((value) {
        setState(() {
          _controller!.play();
        });
      });
    }
  }

//: check for cache
  Future<FileInfo?> checkCacheFor(String url) async {
    final FileInfo? value = await DefaultCacheManager().getFileFromCache(url);
    // timer();
    return value;
  }

//:cached Url Data
  void cachedForUrl(String url) async {
    await DefaultCacheManager().getSingleFile(url).then((value) {
      // print('downloaded successfully done for $url');
    });
  }

//:Dispose
  @override
  void dispose() {
   // // print('dispo');
   //  _controller!.dispose();

    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      (_controller == null)
        ?gradientContainer()
        : ((_controller!.value.isInitialized)
        ?
    VideoPlayer(_controller!)
        :gradientContainer()
      );
  }

  Widget gradientContainer(){
    return Container(
        color: Colors.black.withOpacity(0.9),
        child:Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: const [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    const Color(0XFFdc00ff).withOpacity(0.3),
                    const Color(0XFF00ddff).withOpacity(0.3),
                    const Color(0XFF841111).withOpacity(0.3),
                    const Color(0XFFf4dcdc).withOpacity(0.3),
                  ]
              ),
            )));

  }


}







// _controller!.pause();
// second=_controller!.value.duration.inSeconds;
// print(_controller!.value.size);
// print(_controller!.value.duration);