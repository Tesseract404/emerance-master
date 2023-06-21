import 'package:flutter/material.dart';

class GetPlanButton extends StatelessWidget {
  final int indicator;
  const GetPlanButton({Key? key, required this.indicator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .053,
      width: MediaQuery.of(context).size.width * .4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Color(0xFF1d66db)),
      child: MaterialButton(
        onPressed: () {
          if(indicator==1){
            Navigator.pushNamed(context, '/healthDetails');
          }else{
            Navigator.pushNamed(context, '/carDetails');
          }
        },
        child: Center(
          child: Text(
            "Get Plan",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'PlayfairDisplay',
                fontSize: 22.5,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
