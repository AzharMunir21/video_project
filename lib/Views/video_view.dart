import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_project/Views/video_item.dart';
import 'package:video_project/controller/video_controller.dart';

import '../main.dart';

class VideoView extends StatefulWidget {
  final int index;
  const VideoView({required this.index});
  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
 final VideoController _VideoController=VideoController();
  @override
  void initState() {
    super.initState();
    function();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //     child: Text('${widget.index}'),
        //     onPressed:(){
        //
        //
        // }),

        body: Stack(children: [
      SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: VideoMaped(
            url:'/data/data/com.example.video_project/app_flutter/video/video${widget.index}',
            // '/data/data/com.example.video_project/app_flutter/my${widget.index}',
            // newList[1].toString(),
            // '/data/data/com.example.video_project/app_flutter/myFile.txt',
            // ( videoList[widget.index]['path']).toString(),
            index: widget.index,
          )),
      Positioned(
          bottom: 10,
          child: Center(
              child: button(text: 'Video   ${widget.index}', ontab: () {
                _VideoController.getRequest();
                // _VideoController.startDownloading();

              })))
    ]));
  }

  Widget button({required String text, required Function() ontab}) {
    return Container(
        width:MediaQuery.of(context).size.width*0.99,
        // color: Colors.indigo,
        child:Center(
        child: Container(
            margin: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: TextButton(
                onPressed: ontab,
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.indigo),
                )))));
  }
}


 function(){

   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
   SystemChrome.setPreferredOrientations([
     DeviceOrientation.portraitDown,
     DeviceOrientation.portraitUp,
   ]);

 }




//
//
// Widget button({ required String text,  required Function() ontab}) {
//   return Container(
//       margin: EdgeInsets.only(left: 5),
//       decoration:  BoxDecoration(
//           color: Colors.white.withOpacity(0.5),
//           borderRadius: const BorderRadius.all(Radius.circular(10))),
//       child: TextButton(onPressed: ontab, child: Text(text,style: const TextStyle(color: Colors.indigo),)));
// }

// Positioned(
// bottom: 10,
// child: Container(
// height: 50,
// // color: Colors.cyan,
// width: MediaQuery.of(context).size.width * 0.99,
// child:
//
//     ListView.builder(
//         scrollDirection: Axis.horizontal ,
//         itemCount: 6,
//         itemBuilder:(_,index){
//       return
//         button(text: 'Video$index', ontab: () {
//
//           Get.offAll(()=>Home(index:index, ));
//             print(index);
//
//         });
//
//     })
//
//
// // ListView(
// // scrollDirection: Axis.horizontal,
// // // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // crossAxisAlignment: CrossAxisAlignment.,
// // children: [
// //
// //   button(text: 'Video1', ontab: () {
// //     Get.offAll(PlayerController(index:,))
// //
// //   }),
// //   button(text: 'Video2', ontab: () {  }),
// //   button(text: 'Video3', ontab: () {  }),
// //   button(text: 'Video4', ontab: () {  }),
// //   button(text: 'Vide5', ontab: () {  }),
// //   button(text: 'Vide6', ontab: () {  }),
// //
// // ])
//
//
//
//
// ))
