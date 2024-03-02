import 'package:flutter/cupertino.dart';

class TodayRatingCard extends StatelessWidget {
  const TodayRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 55,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/ratingcard.png'),
              fit: BoxFit.fill)),
    );
  }
}
