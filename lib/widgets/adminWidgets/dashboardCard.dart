import 'package:flutter/material.dart';

class dashboardCard extends StatelessWidget {
  final String title;
  final String image;
  final String route;
  const dashboardCard(
      {Key? key, required this.title, required this.image, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(17, 15, 17, 0),
        child: Container(
          height: 110,
          width: 580,
          decoration: BoxDecoration(
            color: Color(0xFFe0caca),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              children: [
                Image(
                  image: AssetImage(image),
                  height: 70,
                  width: 70,
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
