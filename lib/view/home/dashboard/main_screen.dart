import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: AppBar(
            actions: [
              Padding(
                padding:
                    const EdgeInsets.only(right: 5, left: 5, bottom: 5, top: 6),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 10, 21, 94),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                      child: Image(
                    image: AssetImage('lib/assets/images/profile.png'),
                  )),
                ),
              ),
            ],
            centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'lib/assets/images/coin.png',
                  width: 25,
                  height: 25,
                ),
                const Text(
                  '3012',
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 10, 21, 94),
                    borderRadius: BorderRadius.circular(30)),
                child: isDrawerOpen
                    ? GestureDetector(
                        child: const Image(
                          image: AssetImage('lib/assets/images/appbaricon.png'),
                        ),
                        onTap: () {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            isDrawerOpen = false;
                          });
                        },
                      )
                    : GestureDetector(
                        child: Image.asset('lib/assets/images/appbaricon.png'),
                        onTap: () {
                          setState(() {
                            xOffset = 290;
                            yOffset = 80;
                            isDrawerOpen = true;
                          });
                        },
                      ),
              ),
            ),
          ),
        ),
        AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(isDrawerOpen ? 0.85 : 1.00)
            ..rotateZ(isDrawerOpen ? -50 : 0),
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: isDrawerOpen
                ? BorderRadius.circular(40)
                : BorderRadius.circular(0),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 76,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage('lib/assets/images/mainbg.png'),
                            fit: BoxFit.fitWidth,
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class NewPadding extends StatelessWidget {
//   final String image1;
//   final String text1;
//   final String image2;
//   final String text2;

//   const NewPadding({
//     Key key,
//     this.image1,
//     this.text1,
//     this.image2,
//     this.text2,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 35),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Container(
//             width: 150,
//             height: 150,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.1),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 0),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 8),
//                   child: Image(
//                     height: 100,
//                     width: 100,
//                     image: AssetImage(image1),
//                   ),
//                 ),
//                 Text(
//                   text1,
//                   style: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 15,
//                       decoration: TextDecoration.none),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             width: 150,
//             height: 150,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.1),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 0),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 8),
//                   child: Image(
//                     height: 100,
//                     width: 100,
//                     image: AssetImage(image2),
//                   ),
//                 ),
//                 Text(
//                   text2,
//                   style: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 15,
//                       decoration: TextDecoration.none),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
