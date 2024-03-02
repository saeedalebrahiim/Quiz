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
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/ratingcard.png'),
              fit: BoxFit.fill)),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            "$id .",
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
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
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 90,
          ),
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/assets/images/onemonth.png'),
                    fit: BoxFit.fill)),
            width: 15,
            height: 15,
          ),
          Text(
            trueAnswer,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
