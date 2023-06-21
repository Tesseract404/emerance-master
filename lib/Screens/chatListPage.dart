import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emerance/Auth/APIs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chatListPage extends StatefulWidget {
  const chatListPage({Key? key}) : super(key: key);

  @override
  State<chatListPage> createState() => _chatListPageState();
}

class _chatListPageState extends State<chatListPage> {
  @override
  void initState() {
    print(FirebaseFirestore.instance
        .collection('chats')
        .doc()
        .snapshots()
        .length); // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFebebeb),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFebebeb),
          centerTitle: true,
          leading: GestureDetector(
            child: const Icon(
              CupertinoIcons.back,
              color: Colors.black87,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Messages',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black87),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * .89,
            width: MediaQuery.of(context).size.width * 1,
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('chats').snapshots(),
                builder: (context, snapshot) {
                  var v=FirebaseFirestore.instance.collection('chats/${snapshot.data!.docs[0].id}/messages/').snapshots();
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/chat');
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              // backgroundColor
                              child: Center(
                                  child: Container(
                                child: Icon(Icons.person),
                              )),
                            ),
                            title: Text(
                              // snapshot.data!.docs[index].id,
                              'Ambulance',
                              style: TextStyle(
                                fontFamily: 'Academy Engraved LET',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              'Emergency',
                              style: TextStyle(
                                fontFamily: 'Academy Engraved LET',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ));
  }
}
