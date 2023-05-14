import 'package:flutter/material.dart';
class togglebuttons extends StatefulWidget {
  const togglebuttons({Key? key}) : super(key: key);

  @override
  State<togglebuttons> createState() => _togglebuttonsState();
}

class _togglebuttonsState extends State<togglebuttons> {

  int? groupValue;
  static const List<String> selections = <String>[
    'Car & Health Insurace',
    'Only Car Insurance',
    'Only Health Insurance',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Radio<int>(
                  value: index,
                  groupValue: groupValue,
                  toggleable: true,
                  onChanged: (int? value) {
                    setState(() {
                      groupValue = value;
                    });
                  }),
              Text(selections[index]),
            ],
          );
        },
        itemCount: selections.length,
      ),
    );
  }
}
