import 'dart:convert';
import 'dart:developer';

import 'package:emerance/Auth/Models/ChatUser.dart';
import 'package:emerance/widgets/textCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Auth/APIs.dart';
import '../Auth/Models/Message.dart';
class ChattingPage extends StatefulWidget {
  final ChatUser user;
  const ChattingPage({Key? key, required this.user}) : super(key: key);

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  List<Message>_list =[];
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFebebeb),
      appBar: AppBar(
        toolbarHeight: 75,
        elevation: 0,
        backgroundColor: Color(0xFFcee0d3),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: GestureDetector(
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black87,
              size: 28,
            ),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ),
        //centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox( width: 80),
            Text(
              'Emerance',
              style: TextStyle(
                fontFamily: 'Academy Engraved LET',
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.green ,
              ),
            ),
            Text(
              'Direct message ',
              style: TextStyle(
                fontFamily: 'Academy Engraved LET',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey ,
              ),
            ),
          ],
        ),

      ),
      body: Column(
        children: [
          Expanded(
              child:StreamBuilder(
                stream: APIs.getAllTexts(widget.user),
                builder: (context,snapshot) {
                  switch (snapshot.connectionState){
                    case ConnectionState.none:
                      return const SizedBox();
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                    case ConnectionState.done:
                      final data = snapshot.data?.docs;
                      log('Data: ${jsonEncode(data![0].data())}');
                      _list =data
                      ?.map((e) => Message.fromJson(e.data())).toList()??[];

                      if(_list.isNotEmpty){
                        return ListView.builder(
                            itemCount: _list.length,
                            // padding: EdgeInsets.,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context,index){
                              return textCard(message: _list[index], );
                            });
                      }
                      else{
                        return const Scaffold(
                          body: Center(
                            child: Text('Send Text',
                            style: TextStyle(fontSize: 20),)
                          ),
                        );
                      }
                  }
                },
              )
          ),



          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)
                      ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          const Icon(Icons.edit_rounded,
                          size:23,
                            color: Colors.black38,
                          ),
                          SizedBox(width: 10,),
                           Expanded(
                            child: TextField(
                              controller: _textController,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                               decoration: const InputDecoration(
                                hintText: 'Write text',
                                hintStyle: TextStyle(color: Colors.black38),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: (){
                              if(_textController.text.isNotEmpty){
                                APIs.sendMessage(widget.user, _textController.text);
                                _textController.text='';
                              }
                            },
                             icon: const Icon (Icons.send_rounded,size: 25,color: Colors.black38,),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
