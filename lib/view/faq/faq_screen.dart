import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/global.dart';
import 'package:quiz/provider/faq.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: primaryColor,
            image: const DecorationImage(
                image: AssetImage('lib/assets/images/faqbg.png'),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('lib/assets/images/back.png'))),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Quiz FAQ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(
                  width: 65,
                )
              ],
            ),
            const SizedBox(
              height: 120,
            ),
            Consumer<FAQState>(builder: (context, value, child) {
              return Visibility(
                visible: value.faqs.isNotEmpty,
                replacement: Center(
                  child: CircularProgressIndicator(),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var element in value.faqs)
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'lib/assets/images/faqsticker.png'))),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                element.question,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),

                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20),
                    //   child: InkWell(
                    //     onTap: () {},
                    //     child: Row(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Container(
                    //           width: 45,
                    //           height: 45,
                    //           decoration: const BoxDecoration(
                    //               image: DecorationImage(
                    //                   image: AssetImage(
                    //                       'lib/assets/images/faqsticker.png'))),
                    //         ),
                    //         const SizedBox(
                    //           width: 20,
                    //         ),
                    //         const Text(
                    //           'Terms of receiving money?',
                    //           style: TextStyle(color: Colors.white),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
            }),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 250,
                    height: 50,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/assets/images/faqbtn.png'),
                            fit: BoxFit.fill)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
