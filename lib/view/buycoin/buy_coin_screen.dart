// import 'dart:async';

// import 'package:bilgimizde/components/coin_packages.dart';
// import 'package:bilgimizde/controller/profile/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:bilgimizde/global.dart';
// import 'package:bilgimizde/provider/profile.dart';

// class BuyCoinScreen extends StatefulWidget {
//   const BuyCoinScreen({super.key});

//   @override
//   State<BuyCoinScreen> createState() => _BuyCoinScreenState();
// }

// class _BuyCoinScreenState extends State<BuyCoinScreen> {
//   final InAppPurchase _iap = InAppPurchase.instance;

//   bool _isAvailable = true;
//   List<ProductDetails> _products = [];
//   final List<PurchaseDetails> _purchases = [];
//   StreamSubscription? _subscription;

//   @override
//   void initState() {
//     _initialize();

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _subscription!.cancel();
//     super.dispose();
//   }

//   void _initialize() async {
//     print("in here");
//     try {
//       _isAvailable = await _iap.isAvailable();
//       // print(_iap.)
//       print(_isAvailable);
//       if (_isAvailable) {
//         await _getProducts();
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   _getProducts() async {
//     try {
//       Set<String> ids = {
//         "10.p",
//         "50.p",
//         "80.p",
//         "100.p",
//       };
//       ProductDetailsResponse response = await _iap.queryProductDetails(ids);
//       setState(() {
//         _products = response.productDetails;
//       });

//       print("${response.productDetails}  products details");
//       print("${response.error}  products error");
//       print("${response.notFoundIDs}  products notFound");
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//             color: primaryColor,
//             image: const DecorationImage(
//                 image: AssetImage('lib/assets/images/bg1.png'),
//                 fit: BoxFit.fill)),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 15, top: 45),
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                         width: 50,
//                         height: 50,
//                         decoration: const BoxDecoration(
//                             image: DecorationImage(
//                                 image:
//                                     AssetImage('lib/assets/images/back.png'))),
//                       ),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 18),
//                     child: Text(
//                       'Buy Coin',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 18),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 65,
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 18,
//               ),
//               Center(
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       'lib/assets/images/coin.png',
//                       width: 25,
//                       height: 25,
//                     ),
//                     Consumer<ProfileState>(
//                       builder: (context, value, child) {
//                         var formattedNumber =
//                             NumberFormat.compact().format(value.userBalance);
//                         return Text(
//                           formattedNumber,
//                           //  value.userBalance.toString(),
//                           style: const TextStyle(
//                               fontSize: 30,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600),
//                         );
//                       },
//                     ),
//                     const Text(
//                       'Available to use',
//                       style: TextStyle(
//                           color: Colors.grey,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 10),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const Text(
//                       'Coins Packages',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     for (var prod in _products) ...[
//                       CoinPackages(
//                         coinCount: prod.title,
//                         price: prod.price,
//                         onPress: () {
//                           print("clicked");
//                           _iap
//                               .buyConsumable(
//                             purchaseParam: PurchaseParam(
//                               productDetails: prod,
//                             ),
//                           )
//                               .then((value) {
//                             print(value.toString() + " " + "consumed");
//                             if (value) {
//                               ProfileController.addToBalance(
//                                 context: context,
//                                 count: int.parse(prod.title),
//                               );
//                             }
//                           });
//                         },
//                       ),
//                     ],
//                     const Text(
//                       'How trust us?',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 20),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Image.asset(
//                       'lib/assets/images/buycoinimg.png',
//                       width: 200,
//                       height: 100,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 25, right: 25),
//                       child: Text(
//                         maxLines: 10,
//                         'At Bilgimizdeh, we understand that trust is an important factor when making in-app purchases. Thats why we use Google Pay, a secure and reliable payment platform trusted by millions of users worldwide.',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 12),
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 25, right: 25, top: 10),
//                       child: Text(
//                         maxLines: 10,
//                         'At Bilgimizdeh, we understand that trust is an important factor when making in-app purchases. Thats why we use Google Pay, a secure and reliable payment platform trusted by millions of users worldwide.',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 12),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 100,
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
