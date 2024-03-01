import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quiz/model/dto/score.dart';

class AllRatingCard extends StatelessWidget {
  final String? name, imgProfile, id;
  const AllRatingCard(
      {super.key,
      this.price,
      this.name,
      this.imgProfile,
      this.id,
      required this.score,
      required this.index});

  final UserScore score;
  final int index;
  final String? price;

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
            "$index .",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: CachedNetworkImage(
                imageUrl: score.applicationUserUserPicUrl ?? "",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 10, 21, 94),
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Image(
                  image: AssetImage('lib/assets/images/profile.png'),
                ),
              ),
            ),
          ),
          Text(
            score.applicationUserUserName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 45,
          ),
          Text(
            '${price ?? ""} TL',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
