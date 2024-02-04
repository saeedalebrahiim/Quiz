import 'package:flutter/material.dart';
import 'package:quiz/view/auth/login/login_screen.dart';
import 'package:quiz/view/auth/register/register_screen.dart';

class EnterScreen extends StatelessWidget {
  const EnterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            height: 380,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/assets/images/enterbg.jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text('Gücümüz bilgimizdedir.'),
                Text('Öğrenelim ve ödül kazanalım.'),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => RegisterScreen(),
                          transitionDuration: const Duration(milliseconds: 500),
                          transitionsBuilder: (_, a, __, c) => FadeTransition(
                                opacity: a,
                                child: c,
                              )),
                    );
                  },
                  child: Container(
                    height: 35,
                    width: 180,
                    child: Center(
                        child: Text(
                      'Üye ol',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'lib/assets/images/enterbuttm.png'))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => LoginScreen(),
                          transitionDuration: const Duration(milliseconds: 500),
                          transitionsBuilder: (_, a, __, c) => FadeTransition(
                                opacity: a,
                                child: c,
                              )),
                    );
                  },
                  child: Container(
                    height: 35,
                    width: 180,
                    child: Center(
                      child: Text(
                        'Giriş',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/assets/images/go.png'))),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
