import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  SliderPage(this.title, this.description, this.image);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          SvgPicture.asset(
            image,
            width: width * 0.6,
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              textAlign: TextAlign.center,
              description,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.7,
                  height: 1.5),
            ),
          ),
          SizedBox(height: 60,)
        ],
      ),
    );
  }
}
