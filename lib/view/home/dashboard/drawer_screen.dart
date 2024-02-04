import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 3, 66),
          image: DecorationImage(
              image: AssetImage('lib/assets/images/bg2.png'),
              fit: BoxFit.fill)),
      child: const Padding(
        padding: EdgeInsets.only(top: 50, left: 40, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Column(
              children: <Widget>[
                // NewRow(
                //   text: 'Settings',
                //   icon: Icons.error_outline,
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // NewRow(
                //   text: 'Profile',
                //   icon: Icons.person_outline,
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // NewRow(
                //   text: 'Messages',
                //   icon: Icons.chat_bubble_outline,
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // NewRow(
                //   text: 'Saved',
                //   icon: Icons.bookmark_border,
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // NewRow(
                //   text: 'Favorites',
                //   icon: Icons.favorite_border,
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // NewRow(
                //   text: 'Hint',
                //   icon: Icons.lightbulb_outline,
                // ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// class NewRow extends StatelessWidget {
//   final IconData icon;
//   final String text;

//   const NewRow({
//     Key key,
//     this.icon,
//     this.text,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Icon(
//           icon,
//           color: Colors.white,
//         ),
//         SizedBox(
//           width: 20,
//         ),
//         Text(
//           text,
//           style: TextStyle(color: Colors.white),
//         )
//       ],
//     );
//   }
// }