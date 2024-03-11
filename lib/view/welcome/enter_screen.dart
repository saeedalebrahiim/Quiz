import 'package:bilgimizde/components/alarms_functions/wifi_alarm.dart';
import 'package:bilgimizde/services/internet_listener.dart';
import 'package:flutter/material.dart';
import 'package:bilgimizde/view/auth/login/login_screen.dart';
import 'package:bilgimizde/view/auth/register/register_screen.dart';

class EnterScreen extends StatefulWidget {
  const EnterScreen({super.key});

  @override
  State<EnterScreen> createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {
  @override
  void initState() {
    checkWifi();
    super.initState();
  }

  checkWifi() {
    ConnectionStatusListener().checkConnection().then((value) {
      if (!value) {
        wifiAlarm(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 2 / 3 - 20,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/assets/images/enterbg.jpg'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 1 / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    'Gücümüz bilgimizdedir.',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const Center(
                  child: Text(
                    'Öğrenelim ve ödül kazanalım.',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const RegisterScreen(),
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            transitionsBuilder: (_, a, __, c) => FadeTransition(
                                  opacity: a,
                                  child: c,
                                )),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 180,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                        'lib/assets/images/enterbuttm.png',
                      ))),
                      child: const Center(
                          child: Text(
                        'Üye ol',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const LoginScreen(),
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            transitionsBuilder: (_, a, __, c) => FadeTransition(
                                  opacity: a,
                                  child: c,
                                )),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 180,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('lib/assets/images/go.png'))),
                      child: const Center(
                        child: Text(
                          'Giriş',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
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
