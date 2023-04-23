// import 'package:flutter/material.dart';
// import 'package:payhere_flutter/payhere_flutter.dart';
//
// class Payment extends StatefulWidget {
//   @override
//   _PaymentState createState() => _PaymentState();
// }
//
// class _PaymentState extends State<Payment> {
//   InitRequest req = InitRequest();
//   String responseText = "";
//
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }
//
//   initPlatformState() {
//     req.setMerchantId("Add_Your_Merchant_Id_Here");
//     req.setMerchantSecret("Add_Your_Merchant_Secret_Here");
//     req.setCurrency("LKR");
//     req.setAmount(1000.00);
//     req.setOrderId("230000123");
//     req.setItemsDescription("Door bell wireless");
//     req.setCustom1("This is the custom message 1");
//     req.setCustom2("This is the custom message 2");
//     req.getCustomer().setFirstName("Saman");
//     req.getCustomer().setLastName("Perera");
//     req.getCustomer().setEmail("samanp@gmail.com");
//     req.getCustomer().setPhone("+94771234567");
//     req.getCustomer().getAddress().setAddress("No.1, Galle Road");
//     req.getCustomer().getAddress().setCity("Colombo");
//     req.getCustomer().getAddress().setCountry("Sri Lanka");
//     req.getCustomer().getDeliveryAddress().setAddress("No.2, Kandy Road");
//     req.getCustomer().getDeliveryAddress().setCity("Kadawatha");
//     req.getCustomer().getDeliveryAddress().setCountry("Sri Lanka");
//     req.getItems().add(Item.create(id: null, name: "demo", quantity: 4, amount: 45.56));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Payhere Test Yasas'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: () async {
//                   PhResponse response =
//                   await PayhereFlutter.oneTimePaymentSandbox(request: req);
//
//                   setState(() {
//                     responseText = response.toJson().toString();
//                   });
//                 },
//                 child: Text("One Time Payment SANDBOX"),
//               ),
//               Text(responseText)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }