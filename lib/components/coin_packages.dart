import 'package:flutter/material.dart';

class CoinPackages extends StatelessWidget {
  const CoinPackages({
    super.key,
    required this.coinCount,
    required this.price,
    required this.onPress,
  });
  final String coinCount;
  final String price;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 480,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            image: const DecorationImage(
              image: AssetImage('lib/assets/images/ratingcard.png'),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image(
                    image: AssetImage('lib/assets/images/coin.png'),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  coinCount,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            Text(
              "$price TL",
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: RawMaterialButton(
                onPressed: () {
                  onPress;
                },
                fillColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "Purchase",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
