import 'package:bilgimizde/components/alarms_functions/wifi_alarm.dart';
import 'package:bilgimizde/controller/auth/auth_controller.dart';
import 'package:bilgimizde/controller/phase2/game.dart';
import 'package:bilgimizde/controller/phase2/request.dart';
import 'package:bilgimizde/controller/profile/profile.dart';
import 'package:bilgimizde/provider/profile.dart';
import 'package:bilgimizde/provider/request_state.dart';
import 'package:bilgimizde/services/internet_listener.dart';
import 'package:bilgimizde/view/buycoin/buy_coin_screen.dart';
import 'package:bilgimizde/view/buycoin/gem_buy.dart';
import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/profile/profile_screen.dart';
import 'package:bilgimizde/view/rules/rules_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bilgimizde/global.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class WalleteScreen extends StatefulWidget {
  const WalleteScreen({super.key});

  @override
  State<WalleteScreen> createState() => _WalleteScreenState();
}

class _WalleteScreenState extends State<WalleteScreen> {
  bool requested = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    RequestController.requestList(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: primaryColor,
            image: const DecorationImage(
                image: AssetImage('lib/assets/images/bg2.png'),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: InkWell(
                        onTap: () {
                          // Navigator.pop(context);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 10, 21, 94),
                              borderRadius: BorderRadius.circular(30)),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 0, bottom: 0, top: 15),
                      child: InkWell(
                        onTap: () {
                          AuthController.isAuth(context: context);
                          ConnectionStatusListener()
                              .checkConnection()
                              .then((value) {
                            if (!value) {
                              wifiAlarm(context);
                            }
                          });
                          ProfileController.getProfile(context: context);
                          Navigator.of(context).push(
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const ProfileScreen(),
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(
                                      opacity: a,
                                      child: c,
                                    )),
                          );
                        },
                        child: Consumer<ProfileState>(
                          builder: (context, value, child) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Container(
                              width: 50,
                              height: 50,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 10, 21, 94),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: CachedNetworkImage(
                                width: 50,
                                height: 50,
                                imageUrl: value.profile != null &&
                                        value.profile!.userPicUrl != null
                                    ? value.profile!.userPicUrl!
                                    : "",
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 10, 21, 94),
                                    borderRadius: BorderRadius.circular(18),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Image(
                                  image: AssetImage(
                                      'lib/assets/images/profile.png'),
                                ),
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
              ),
              const SizedBox(
                height: 30.0,
              ),
              Consumer<ProfileState>(
                builder: (context, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Image(
                            width: 60,
                            height: 60,
                            image: AssetImage(
                              "lib/assets/images/money.png",
                            ),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Text(
                          (value.profile != null
                                  ? value.profile!.userWalletBalance.toString()
                                  : "0") +
                              " TL",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () {
                          if (!requested) {
                            setState(() {
                              requested = true;
                            });
                            RequestController.addRequest(context: context)
                                .whenComplete(() {
                              setState(() {
                                requested = false;
                              });
                            });
                          }
                        },
                        child: Container(
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: !requested
                                ? Text(
                                    "-",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                    ),
                                  )
                                : SizedBox(
                                    width: 20,
                                    child: CircularProgressIndicator())),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Kazanıyorlar',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'lib/assets/images/allprize.png'))),
                        ),
                        const Text(
                          'Ödül',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Consumer<RequestState>(builder: (context, value, child) {
                return Column(
                  children: [
                    for (var index = 0; index < value.requests.length; index++)
                      SizedBox()
                    // TransAction(),
                  ],
                );

                // ListView.builder(
                //   itemCount: value.allScores.length,
                //   shrinkWrap: true,
                //   itemBuilder: (context, index) => Padding(
                //     padding: const EdgeInsets.symmetric(
                //         vertical: 8.0, horizontal: 25),
                //     child: AllReward(
                //       score: value.allScores[index],
                //       index: index + 1,
                //       reward: index < value.rewardsAll.length
                //           ? value.rewardsAll[index]
                //           : "",
                //     ),
                //   ),
                // );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class TransAction extends StatelessWidget {
  const TransAction({
    super.key,
    required this.amount,
    required this.date,
    required this.state,
  });
  final String amount, date, state;

  @override
  Widget build(BuildContext context) {
    Color color = state == "pending"
        ? Colors.grey
        : state == "Competition prize"
            ? Colors.green
            : Colors.red;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Color.fromARGB(154, 28, 28, 28),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          state == "pending"
                              ? Icons.arrow_right
                              : state == "Competition prize"
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                          color: color,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          '${amount} TL',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    Text(
                      '$date',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Text(
                  "$state",
                  style: TextStyle(
                      color: color, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
