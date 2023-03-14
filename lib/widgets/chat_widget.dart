import 'package:chat_gpt/constants/constants.dart';
import 'package:chat_gpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:chat_gpt/services/assets_manager.dart';


import '../services/assets_manager.dart';

class Chatwidget extends StatelessWidget {
  const Chatwidget({Key? key, required this.msg, required this.chatIndex}) : super(key: key);
final String msg;
final int chatIndex;

  get image => null;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[

        Material(
          color:chatIndex==0 ? scaffoldBackgroundColor:cardColor,
          child: Padding(
            padding: EdgeInsets.all(8.0),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Image.asset(
             chatIndex == 0
                ? AssetsManager.userimage
                  : AssetsManager.botimage,
                height:30,
                width:30,
    ),
          const SizedBox(
          width: 8,
        ),
          Expanded(
            child:Textwidget(
          label: msg,
           ),
          ),
              chatIndex == 0
              ? const SizedBox.shrink()
                  :Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.thumb_up_alt_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.thumb_down_alt_outlined,
                      color: Colors.white)
                    ],
                  )
            ],
             ),
    ),
  ),
  ],
  );
}
}
