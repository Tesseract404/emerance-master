import 'package:emerance/widgets/gap.dart';
import 'package:flutter/material.dart';
class EmergencyWidget extends StatelessWidget {
  final String image;
  final title;
  const EmergencyWidget({Key? key,
    required this.image,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(title=='Ambulance') {
          Navigator.pushNamed(context, '/map_a');
        }
        else{
          Navigator.pushNamed(context, '/map_t');
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xffced7db)
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                height: 135,
                width: 135,
              ),
              gap(height: 12, width: 1),
              Text(title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87 ,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
