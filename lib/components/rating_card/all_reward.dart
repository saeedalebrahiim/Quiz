import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bilgimizde/model/dto/score.dart';

class AllReward extends StatelessWidget {
  const AllReward({
    super.key,
    required this.score,
    required this.index,
    this.isMe,
    required this.reward,
  });

  final RewardScore score;
  final int index;
  final bool? isMe;
  final String reward;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 54,
      decoration: BoxDecoration(
          color: isMe == true ? Colors.white.withOpacity(0.5) : null,
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
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$index .",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: score.applicationUserUserPicUrl ?? "",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 10, 21, 94),
                        borderRadius: BorderRadius.circular(12),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    score.applicationUserFullName ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  isMe == true
                      ? Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "YOU",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
              const SizedBox(
                width: 45,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Row(
              children: [
                Text(
                  '${reward} TL',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
