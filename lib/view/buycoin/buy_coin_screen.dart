import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/global.dart';
import 'package:bilgimizde/provider/profile.dart';

class BuyCoinScreen extends StatelessWidget {
  const BuyCoinScreen({super.key});

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
                      'Buy Coin',
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
                height: 18,
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'lib/assets/images/coin.png',
                      width: 25,
                      height: 25,
                    ),
                    Consumer<ProfileState>(
                      builder: (context, value, child) => Text(
                        value.userBalance.toString(),
                        style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Text(
                      'Available to use',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 10),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Coins Packages',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    const Text(
                      'How trust us?',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'lib/assets/images/buycoinimg.png',
                      width: 200,
                      height: 100,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Text(
                        maxLines: 10,
                        'At Bilgimizdeh, we understand that trust is an important factor when making in-app purchases. Thats why we use Google Pay, a secure and reliable payment platform trusted by millions of users worldwide.',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25, top: 10),
                      child: Text(
                        maxLines: 10,
                        'At Bilgimizdeh, we understand that trust is an important factor when making in-app purchases. Thats why we use Google Pay, a secure and reliable payment platform trusted by millions of users worldwide.',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
