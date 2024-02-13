import 'package:flutter/material.dart';
import 'package:quiz/global.dart';

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
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      'Quiz FAQ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    width: 65,
                  )
                ],
              ),
              SizedBox(
                height: 120,
              ),
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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'lib/assets/images/faqsticker.png'))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'What is Quiz?',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'lib/assets/images/faqsticker.png'))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Terms of receiving money?',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 260,
              ),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/assets/images/faqbtn.png'),
                            fit: BoxFit.fill)),
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
