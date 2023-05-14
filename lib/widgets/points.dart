import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Previlages.dart';
import 'gap.dart';

class points extends StatelessWidget {
  final int select;
  final title;
  const points({Key? key, this.title, required this.select}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          gap(height: 5, width: 1),
          select == 1
              ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Icon(
                    CupertinoIcons.checkmark_alt,
                    color: Colors.green,
                  size: 20,
                  ),
              )
              : Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 5, 0),
                child: Icon(
                    CupertinoIcons.xmark,
                    color: Colors.redAccent,
                    size: 15
                  ),
              ),
          gap(
            width: 5,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
