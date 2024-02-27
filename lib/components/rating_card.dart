import 'package:flutter/cupertino.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 55,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/ratingcard.png'),
              fit: BoxFit.fill)),
    );
  }
}
