import 'package:flutter/material.dart';
class formFieldWidget extends StatelessWidget {
  final title;
  final controller;
  const formFieldWidget({Key? key, this.title, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(7, 0, 0, 5),
              child: TextFormField(

                controller: controller,
              ),
            ),
          )
        ],
      ),
    );
  }
}
