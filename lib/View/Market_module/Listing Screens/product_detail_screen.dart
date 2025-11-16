import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Models/product_model.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/View/Market_module/Listing%20Screens/user_communication_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel model;
  const ProductDetailScreen({super.key, required this.model});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product detail')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 200,
              child: Image.network(widget.model.images[0]),
            ),
            SizedBox(height: 10),
            Text(
              widget.model.name,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              '\$${widget.model.price}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColor.btnColor,
              ),
            ),
            SizedBox(height: 4),
            Text(widget.model.description, style: TextStyle(fontSize: 18)),
            Divider(),
            // Text(
            //   'Seller Information',
            //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            // ),
            // SizedBox(height: 4),
            // Row(
            //   children: [
            //     CircleAvatar(radius: 30, backgroundColor: Colors.deepPurple),
            //     SizedBox(width: 10),
            //     Text(
            //       'Username',
            //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 10),
            // Reusebtn(
            //   title: 'Chat with seller',
            //   ontap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => UserCommunicationScreen(),
            //       ),
            //     );
            //   },
            // ),
            SizedBox(height: 20),
            Reusebtn(
              title: 'Buy Now',
              ontap: () async {
                await Stripe.instance.initPaymentSheet(
                  paymentSheetParameters: SetupPaymentSheetParameters(
                    paymentIntentClientSecret: "s",
                    merchantDisplayName: 'My App',
                    // customerId: "cus_TQfZ5Xo4gKx1ah",
                    // customerEphemeralKeySecret: 'ephemeralKey',
                    style: ThemeMode.light, // optional
                  ),
                );
                Stripe.instance.presentPaymentSheet();
              },
            ),
          ],
        ),
      ),
    );
  }
}
