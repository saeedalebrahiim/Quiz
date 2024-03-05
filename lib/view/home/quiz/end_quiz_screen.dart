import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/provider/profile.dart';
import 'package:bilgimizde/view/profile/profile_screen.dart';

class EndQuizScreen extends StatelessWidget {
  const EndQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 10, 21, 94),
            image: DecorationImage(
                image: AssetImage('lib/assets/images/bg2.png'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      // Navigator.of(context).push(
                      //   PageRouteBuilder(
                      //       pageBuilder: (_, __, ___) => const HomeScreen(),
                      //       transitionDuration:
                      //           const Duration(milliseconds: 500),
                      //       transitionsBuilder: (_, a, __, c) => FadeTransition(
                      //             opacity: a,
                      //             child: c,
                      //           )),
                      // );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image:
                                AssetImage('lib/assets/images/appbaricon.png'),
                          ),
                          color: const Color.fromARGB(255, 10, 21, 94),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 23),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'lib/assets/images/coin.png',
                        width: 25,
                        height: 25,
                      ),
                      const Text(
                        '3012',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const ProfileScreen(),
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            transitionsBuilder: (_, a, __, c) => FadeTransition(
                                  opacity: a,
                                  child: c,
                                )),
                      );
                    },
                    child: Consumer<ProfileState>(
                      builder: (context, value, child) => Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 10, 21, 94),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: CachedNetworkImage(
                          width: 45,
                          height: 45,
                          imageUrl: value.profile != null
                              ? value.profile!.userPicUrl
                              : "",
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

                    //  Container(
                    //   decoration: BoxDecoration(
                    //       color: const Color.fromARGB(255, 10, 21, 94),
                    //       borderRadius: BorderRadius.circular(30)),
                    //   child: const Center(
                    //     child: Image(
                    //   image: AssetImage('lib/assets/images/profile.png'),
                    // )),
                    // ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'End of the Test',
                    style: TextStyle(
                        color: Color.fromARGB(255, 96, 131, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/assets/images/congrats.png'),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Congrats!',
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  Text(
                    'You are among',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'best 50 players , ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 96, 131, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Text(
                        'So  you grant',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  Text(
                    'prize at end of the season',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'See Best 50 Players',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                    ),
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 0.5,
                              color: Colors.grey.shade300)
                        ]),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width - 110,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assets/images/light.png'),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Try to stay among 50 players to grant prize',
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
            Text(
              'at end of the season',
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Again',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                width: 160,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 86, 196, 90),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              child: Container(
                child: Center(
                  child: Text(
                    'Home',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
                width: 160,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
