import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Models/product_model.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/View/Market_module/Listing%20Screens/order_details_screen.dart';
import 'package:gamerconnect/View/Market_module/payment_screen.dart';
import 'package:gamerconnect/View/payment/payment_screen.dart';
import 'package:gamerconnect/View/Market_module/Listing%20Screens/user_communication_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel model;
  const ProductDetailScreen({super.key, required this.model});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Future<void> openWhatsApp({required String phone, String? message}) async {
    final cleaned = phone;
    if (cleaned.isEmpty) {
      throw 'Phone number is empty or invalid';
    }

    // Try native app first
    final nativeUri = Uri.parse(
      'whatsapp://send?phone=$cleaned${message != null ? '&text=${Uri.encodeComponent(message)}' : ''}',
    );

    if (await canLaunchUrl(nativeUri)) {
      await launchUrl(nativeUri, mode: LaunchMode.externalApplication);
      return;
    }

    // Fallback to web link (works if WhatsApp is not installed; opens web.whatsapp.com)
    final webUri = Uri.parse(
      'https://wa.me/$cleaned${message != null ? '?text=${Uri.encodeComponent(message)}' : ''}',
    );

    if (await canLaunchUrl(webUri)) {
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
      return;
    }

    throw 'Could not open WhatsApp (neither app nor web link could be launched).';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () async {
          try {
            await openWhatsApp(
              phone: widget.model.sellerContact,
              message: "Hi",
            );
          } catch (e) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: $e')));
          }
        },
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.deepPurple,
          backgroundImage: NetworkImage(
            "https://cdn-icons-png.flaticon.com/512/3670/3670051.png",
          ),
        ),
      ),
      appBar: AppBar(title: Text('Product detail') , leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back , color: Colors.white,)),),
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
            Text(
              'Seller Information',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.deepPurple,
                  backgroundImage: NetworkImage(
                    widget.model.sellerProfile.isEmpty
                        ? "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
                        : widget.model.sellerProfile,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  widget.model.sellerShopName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            // SizedBox(height: 10),
            // Reusebtn(title: 'Chat with seller', ontap: () {}),
            SizedBox(height: 20),
            Reusebtn(
              title: 'Buy Now',
              ontap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        OrderDetailsScreen(product: widget.model),
                  ),
                );

                // await Stripe.instance.initPaymentSheet(
                //   paymentSheetParameters: SetupPaymentSheetParameters(
                //     paymentIntentClientSecret: "s",
                //     merchantDisplayName: 'My App',
                //     // customerId: "cus_TQfZ5Xo4gKx1ah",
                //     // customerEphemeralKeySecret: 'ephemeralKey',
                //     style: ThemeMode.light, // optional
                //   ),
                // );
                // Stripe.instance.presentPaymentSheet();
              },
            ),
          ],
        ),
      ),
    );
  }
}
