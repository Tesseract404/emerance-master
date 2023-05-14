import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emerance/widgets/ReusableRow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final cuser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00072D),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: BackButton(

        ),
        backgroundColor: Color(0xFF00072D),
        elevation: 0,
        title: Text(
          'Profile',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontSize: 19,
            fontWeight: FontWeight.w500,

          ),
        ),
      ),
      body: Column(
        children: [
          StreamBuilder(
              ///working
              stream: FirebaseFirestore.instance
                  .collection("User")
                  .where("userid", isEqualTo: cuser.currentUser!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                var data = snapshot.data!.docs[i];
                                return
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(117, 0, 117, 0),
                                    child: Container(
                                    height: 130,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.lightBlue,
                                        width: 5
                                      )
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: data['image'].toString()==""?Icon(Icons.person,size: 55,color: Colors.blueGrey,):Image(
                                        //fit: BoxFit.cover,
                                        image: NetworkImage('https://img.a.transfermarkt.technology/portrait/big/177907-1663841733.jpg?lm=1'),
                                      ),
                                    ),
                                ),
                                  );
                              }),
                        ),
                        ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              var data = snapshot.data!.docs[i];
                              return ReusableRow(
                                  title: 'Username',
                                  iconData: Icons.person_outline_sharp,
                                  value: data['name']);
                            }),
                        ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              var data = snapshot.data!.docs[i];
                              return ReusableRow(
                                  title: 'Email',
                                  iconData: Icons.mail_outline,
                                  value: data['email']);
                            }),
                        ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              var data = snapshot.data!.docs[i];
                              return ReusableRow(
                                  title: 'Password',
                                  iconData: Icons.key_outlined,
                                  value: '******');
                            }),
                        ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              var data = snapshot.data!.docs[i];
                              return ReusableRow(
                                  title: 'Phone',
                                  iconData: Icons.phone,
                                  value: (data['phone']));
                            }),
                        ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              var data = snapshot.data!.docs[i];
                              return ReusableRow(
                                  title: 'Date of Birth',
                                  iconData: Icons.calendar_month,
                                  value: data['date of birth']);
                            }),

                        ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              var data = snapshot.data!.docs[i];
                              return ReusableRow(
                                  title: 'Address',
                                  iconData: Icons.home_sharp,
                                  value: (data['address']));
                            }),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                          child: GestureDetector(
                            child: Container(
                              child:
                              Center(
                                child: Text(
                                  'Edit Details',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                              height: 40,
                              width: 190,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blueGrey,
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                Navigator.pushNamed(context, '/editD');
                              });
                            },

                          ),
                        )



                      ],
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }

                ///working


              })
        ],
      ),
    );
  }
}
