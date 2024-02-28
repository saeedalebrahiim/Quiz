import 'package:flutter/material.dart';

class OneMonthRatingCard extends StatelessWidget {
  final String id, imgProfile, trueAnswer, name;
  const OneMonthRatingCard({
    super.key,
    required this.id,
    required this.imgProfile,
    required this.trueAnswer,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 50,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Text(
            id + " .",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage(imgProfile), fit: BoxFit.fill)),
          ),
          Text(
            name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 90,
          ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/assets/images/onemonth.png'),
                    fit: BoxFit.fill)),
            width: 15,
            height: 15,
          ),
          Text(
            trueAnswer,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/ratingcard.png'),
              fit: BoxFit.fill)),
    );
  }
}
