import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bilgimizde/model/dto/score.dart';

class AllRatingCard extends StatelessWidget {
  final String? name, imgProfile, id;
  const AllRatingCard(
      {super.key,
      this.price,
      this.name,
      this.imgProfile,
      this.id,
      this.isPrice,
      this.isRank,
      this.showChanges,
      this.isMe,
      required this.score,
      required this.index});

  final UserScore score;
  final int index;
  final String? price;
  final bool? showChanges;
  final bool? isPrice;
  final bool? isRank;
  final bool? isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 58,
      decoration: BoxDecoration(
          color: isMe == true
              ? Colors.white.withOpacity(0.15)
              : const Color.fromRGBO(28, 28, 28, 0.70),
          // image: const DecorationImage(
          //   image: AssetImage('lib/assets/images/ratingcard.png'),
          //   fit: BoxFit.fill,
          // ),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isRank == true ? '${score.id + 1}.' : "$index .",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    showChanges == true
                        ? Visibility(
                            visible: score.changes > 0,
                            replacement: Row(
                              children: [
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.red,
                                ),
                                Text(
                                  "${score.changes}",
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 10),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.green,
                                ),
                                Text(
                                  "${score.changes}",
                                  style: const TextStyle(
                                      color: Colors.green, fontSize: 12),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
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
                  SizedBox(
                    width: 95,
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text: score.applicationUserFullName ??
                                  (score.applicationUserUserName!
                                          .replaceRange(0, 7, "XXXXXXX") ??
                                      "-"),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ]),
                    ),
                    // child: Text(
                    //   score.applicationUserFullName ??
                    //       (score.applicationUserUserName!
                    //               .replaceRange(0, 7, "XXXXXXXX") ??
                    //           "-"),
                    //   style: const TextStyle(
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 12,
                    //   ),
                    // ),
                  ),
                  isMe == true
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            "Buradayım",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              const SizedBox(
                width: 25,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 22.0),
            child: Row(
              children: [
                isPrice == true
                    ? const SizedBox()
                    : const Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 12,
                        ),
                      ),
                Text(
                  isPrice == true
                      ? '${price ?? ""}'
                      : '${score.sumCurrectAnswer}',
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
