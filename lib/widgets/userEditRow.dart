import 'package:flutter/material.dart';
class userEditRow extends StatelessWidget {
  final title;
  final String val;
  final TextEditingController  valController;
  const userEditRow({Key? key, this.title, required this.val, required this.valController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Row(
      children: [
        Expanded(
          flex:2,
          child: Text(title,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        SizedBox(width: 2),
        Expanded(
          flex:5,
          child:TextFormField(
            controller: valController,
            initialValue: val,
            decoration: InputDecoration(
              //label: Text('Full Name :')
            ),
          ),
        )
      ],
    );
  }
}
