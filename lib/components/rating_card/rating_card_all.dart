import 'package:flutter/material.dart';

class AllRatingCard extends StatelessWidget {
  final String price, name, imgProfile, id;
  const AllRatingCard(
      {super.key,
      required this.price,
      required this.name,
      required this.imgProfile,
      required this.id});

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
            width: 45,
          ),
          Text(
            price + ' TL',
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
