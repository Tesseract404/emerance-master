import 'package:emerance/Auth/Models/Message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Auth/APIs.dart';
class textCard extends StatefulWidget {
    final Message message;
  const textCard({Key? key, required this.message}) : super(key: key);

  @override
  State<textCard> createState() => _textCardState();
}

class _textCardState extends State<textCard> {

  @override
  Widget build(BuildContext context) {
    return APIs.user.uid == widget.message.formid
        ?_sender()
        :_receiver();
  }

  Widget _sender(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              widget.message.sent,
              style: TextStyle(
                  fontSize: 12,color: Colors.grey
              ),
            ),
          ),

        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15) ,
                color: CupertinoColors.systemGreen
              ),
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Text(
                  widget.message.msg,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
  Widget _receiver(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15) ,
                  color: CupertinoColors.systemGrey3
              ),
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Text(
                  widget.message.msg,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            widget.message.sent,
            style: TextStyle(
                fontSize: 12,color: Colors.grey
            ),
          ),
        ),
      ],
    );
  }
}
