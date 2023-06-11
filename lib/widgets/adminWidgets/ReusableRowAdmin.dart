import 'package:flutter/material.dart';
class ReusableRowAdmin extends StatelessWidget {
  final String title , value;
  final IconData iconData;
  const ReusableRowAdmin({
    Key? key,
    required this.title,
    required this.iconData,
    required this.value
  })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title:  Text(title,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 17
            ),
          ),
          leading:  Icon(iconData,
            color: Colors.black87
          ),
          trailing: Text(value,
            style: TextStyle(
                color: Colors.green,
              fontSize: 17
            ),
          ),
        )
      ],
    );
  }
}