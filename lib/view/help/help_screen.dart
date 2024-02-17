import 'package:flutter/material.dart';
import 'package:quiz/global.dart';
import 'package:quiz/view/help/add_help_screen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: primaryColor,
            image: const DecorationImage(
                image: AssetImage('lib/assets/images/bg1.png'),
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
                  const Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: Text(
                      'Help',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, top: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => AddHelpScreen(),
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(
                                    opacity: a,
                                    child: c,
                                  )),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('lib/assets/images/add.png'))),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
