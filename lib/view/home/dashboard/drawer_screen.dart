import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bilgimizde/controller/FAQ/faq.dart';
import 'package:bilgimizde/global.dart';
import 'package:bilgimizde/provider/drawer_state.dart';
import 'package:bilgimizde/view/faq/faq_screen.dart';
import 'package:bilgimizde/view/help/help_screen.dart';
import 'package:bilgimizde/view/myrating/today/today_screen.dart';
import 'package:bilgimizde/view/profile/profile_screen.dart';
import 'package:bilgimizde/view/rules/rules_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundShapes(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(
        //   color: primaryColor,

        //   // image: const DecorationImage(
        //   //     image: AssetImage('lib/assets/images/bg2.png'), fit: BoxFit.fill),
        // ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Consumer<DrawerState>(
                builder: (context, value, child) => Visibility(
                  visible: drawerVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 75,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {},
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image(
                                  image:
                                      AssetImage('lib/assets/images/home.png'),
                                  width: 22,
                                  height: 22,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Home',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
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
                              context.read<DrawerState>().changeVisibleTwo();
                            },
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image(
                                  image: AssetImage(
                                      'lib/assets/images/person.png'),
                                  width: 22,
                                  height: 22,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Profile',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        const TodayScreen(),
                                    transitionDuration:
                                        const Duration(milliseconds: 500),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(
                                          opacity: a,
                                          child: c,
                                        )),
                              );
                              context.read<DrawerState>().changeVisibleTwo();
                            },
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image(
                                  image:
                                      AssetImage('lib/assets/images/sun.png'),
                                  width: 22,
                                  height: 22,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'My Rating',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              print("FAQ drawer");
                              FAQController.pageList(context: context);
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        const FaqScreen(),
                                    transitionDuration:
                                        const Duration(milliseconds: 500),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(
                                          opacity: a,
                                          child: c,
                                        )),
                              );
                              context.read<DrawerState>().changeVisibleTwo();
                            },
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image(
                                  image: AssetImage(
                                      'lib/assets/images/coffee.png'),
                                  width: 22,
                                  height: 22,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Questions',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        const RulesScreen(),
                                    transitionDuration:
                                        const Duration(milliseconds: 500),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(
                                          opacity: a,
                                          child: c,
                                        )),
                              );
                              context.read<DrawerState>().changeVisibleTwo();
                            },
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image(
                                  image:
                                      AssetImage('lib/assets/images/book.png'),
                                  width: 22,
                                  height: 22,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Rules',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        const HelpScreen(),
                                    transitionDuration:
                                        const Duration(milliseconds: 500),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(
                                          opacity: a,
                                          child: c,
                                        )),
                              );
                              context.read<DrawerState>().changeVisibleTwo();
                            },
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image(
                                  image:
                                      AssetImage('lib/assets/images/alarm.png'),
                                  width: 22,
                                  height: 22,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Help',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundShapes extends StatefulWidget {
  const BackgroundShapes({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<BackgroundShapes> createState() => _BackgroundShapesState();
}

class _BackgroundShapesState extends State<BackgroundShapes>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
    _controller.repeat(reverse: true);
    super.initState();
  }

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 0, 3, 66),
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: BackgroundPainter(_animation),
                child: Container(),
              );
            },
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeStatusListener((status) {});
    _controller.dispose();
    super.dispose();
  }
}

class BackgroundPainter extends CustomPainter {
  final Animation<double> animation;

  const BackgroundPainter(this.animation);

  Offset getOffset(Path path) {
    final pms = path.computeMetrics(forceClosed: false).elementAt(0);
    final length = pms.length;
    final offset = pms.getTangentForOffset(length * animation.value)!.position;
    return offset;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.maskFilter = const MaskFilter.blur(
      BlurStyle.normal,
      30,
    );
    drawShape1(canvas, size, paint, const Color.fromARGB(105, 63, 70, 202));
    drawShape2(canvas, size, paint, const Color.fromARGB(123, 103, 84, 208));
    drawShape3(canvas, size, paint, const Color.fromARGB(155, 103, 84, 208));
    drawShape4(canvas, size, paint, const Color.fromARGB(155, 152, 58, 180));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

  void drawShape1(
    Canvas canvas,
    Size size,
    Paint paint,
    Color color,
  ) {
    paint.color = color;
    Path path = Path();

    path.moveTo(size.width, 0);
    path.quadraticBezierTo(
      size.width,
      -500,
      size.width,
      0,
    );

    final offset = getOffset(path);
    canvas.drawCircle(offset, 150, paint);
  }

  void drawShape2(
    Canvas canvas,
    Size size,
    Paint paint,
    Color color,
  ) {
    paint.color = color;
    Path path = Path();

    path.moveTo(-5, -5);
    path.quadraticBezierTo(
      0,
      -400,
      0,
      0,
    );

    final offset = getOffset(path);
    canvas.drawCircle(offset, 150, paint);
  }

  void drawShape3(
    Canvas canvas,
    Size size,
    Paint paint,
    Color color,
  ) {
    paint.color = color;
    Path path = Path();

    path.moveTo(0, size.height);
    path.quadraticBezierTo(
      0,
      size.height + 400,
      0,
      size.height,
    );

    final offset = getOffset(path);
    canvas.drawCircle(offset, 150, paint);
  }

  void drawShape4(
    Canvas canvas,
    Size size,
    Paint paint,
    Color color,
  ) {
    paint.color = color;
    Path path = Path();

    path.moveTo(size.width, size.height);
    path.quadraticBezierTo(
      size.width,
      size.height + 400,
      size.width,
      size.height,
    );

    final offset = getOffset(path);
    canvas.drawCircle(offset, 150, paint);
  }
}
