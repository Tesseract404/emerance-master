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
        Navigator.pushNamed(context, '/map');
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.23,
        width: MediaQuery.of(context).size.width * 0.50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xffced7db)
        ),
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
    );
  }
}
