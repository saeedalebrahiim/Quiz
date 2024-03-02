import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/global.dart';
import 'package:quiz/provider/faq.dart';
import 'package:quiz/view/faq/single_saq_screen.dart';

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
        child: SingleChildScrollView(
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
                                image:
                                    AssetImage('lib/assets/images/back.png'))),
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
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var element in value.faqs)
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            SingleFaqScreen(
                                                answer: element.answer),
                                        transitionDuration:
                                            const Duration(milliseconds: 500),
                                        transitionsBuilder: (_, a, __, c) =>
                                            FadeTransition(
                                              opacity: a,
                                              child: c,
                                            )),
                                  );
                                },
                                child: Row(
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
                                    SizedBox(
                                      width: 250,
                                      child: Text(
                                        maxLines: 2,
                                        element.question,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Need any help?',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Send Message',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
