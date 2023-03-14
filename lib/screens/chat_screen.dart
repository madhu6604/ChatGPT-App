//import 'dart:ui';
import 'package:chat_gpt/services/services.dart';
import 'package:chat_gpt/widgets/chat_widget.dart';
import 'package:chat_gpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:chat_gpt/services/assets_manager.dart';
//import 'package:flutter/src/material/app_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../constants/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen ({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping=true;
 late TextEditingController textEditingController;
  @override
  void initState(){
   textEditingController= TextEditingController();
    super.initState();
  }
  @override
  void dispose(){
    textEditingController.dispose;
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 2,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child:Image(
            image:AssetImage('assets/images/i5.jpg'),
          ),

        ),
        title: const Text("ChatGPT"),
        actions:[
          IconButton(
            onPressed: () async {
              await Services.showModelSheet(context: context);

          },
              icon:const Icon(Icons.more_vert_rounded, color: Colors.white),
          ),
        ],

        //backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (contex,index){
                  return Chatwidget(
                    msg:  chatMessages[index]["msg"].toString(),
                    chatIndex: int.parse(
                      chatMessages[index]["chatIndex"].toString()),
                    );
                }),
            ),
            if (_isTyping) ...[
              const SpinKitThreeBounce(
                color:Colors.white,
                size: 18,
              ),
              SizedBox(height:15,),
              Material(
                color: cardColor,
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                 Expanded(
                   child:TextField(
                     style: const TextStyle(color:Colors.white),
                     controller:textEditingController,
                     onSubmitted:(value){
                     //TODO send message
                     },
                     decoration: const InputDecoration.collapsed(
                         hintText: "How can I help you",
                         hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.send,color:Colors.white)),
                 ],
                ),
               ),
              ),
             ]
          ],
        ),
      ),
    );
  }
}

