import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/google_btn.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Components/reuse_textform.dart';
import 'package:gamerconnect/Models/product_model.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/View/Auth/login_screen.dart';
import 'package:gamerconnect/View/payment/payment_screen.dart';
import 'package:gamerconnect/providers/auth_pro.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class OrderDetailsScreen extends StatefulWidget {
  final ProductModel product;
  const OrderDetailsScreen({super.key, required this.product});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final addressCtrl = TextEditingController();
  final quantityCtrl = TextEditingController();
  final fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Order Details')),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: fKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  // Center(
                  //   child: Text("Create An Account", style: TextUtils.heading1),
                  // ),
                  Text("Please provide order details", style: TextUtils.body14),
                  SizedBox(height: media.height * 0.03),
                  ReuseTextForm(
                    controller: namecontroller,
                    hinttext: 'Name',
                    icondata: Icons.person,
                    validator: (val) {
                      if (val!.trim().isEmpty) {
                        return "Please enter name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: media.height * 0.015),

                  ReuseTextForm(
                    controller: phonecontroller,
                    keyboardType: TextInputType.phone,
                    hinttext: 'Phone',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone number is required';
                      }

                      final phoneRegex = RegExp(r'^[0-9]{8,}$');

                      if (!phoneRegex.hasMatch(value)) {
                        return 'Enter a valid phone number';
                      }

                      return null;
                    },
                    icondata: Icons.phone,
                  ),

                  SizedBox(height: media.height * 0.015),

                  ReuseTextForm(
                    controller: addressCtrl,
                    hinttext: 'Address',
                    icondata: Icons.location_city,

                    // obscure: true,
                    validator: (val) {
                      if (val!.trim().isEmpty) {
                        return "Please enter address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: media.height * 0.015),

                  ReuseTextForm(
                    controller: quantityCtrl,
                    hinttext: 'Quantity',
                    icondata: Icons.shopping_bag,

                    // obscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter product count";
                      }

                      final count = int.tryParse(value);
                      if (count == null) {
                        return "Only numbers allowed";
                      }

                      if (count <= 0) {
                        return "Count must be greater than 0";
                      }

                      return null; // valid
                    },
                  ),

                  SizedBox(height: media.height * 0.05),
                  Reusebtn(
                    title: "Continue",
                    ontap: () {
                      if (fKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreditCardInputScreen(
                              product: widget.product,
                              count: int.parse(quantityCtrl.text),
                              name: namecontroller.text,
                              phone: phonecontroller.text,
                              address: addressCtrl.text,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  // SizedBox(height: media.height * 0.03),
                  // Row(
                  //   children: [
                  //     const Expanded(child: Divider()),
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 20),
                  //       child: Text('OR', style: TextUtils.body18),
                  //     ),
                  //     const Expanded(child: Divider()),
                  //   ],
                  // ),

                  // SizedBox(height: media.width * .03),
                  // RichText(
                  //   text: TextSpan(
                  //     text: "Already have an Account? ", // First part
                  //     style: TextUtils.body16,
                  //     children: [
                  //       TextSpan(
                  //         text: "Log In", // Second part
                  //         recognizer: TapGestureRecognizer()
                  //           ..onTap = () {
                  //             Navigator.pop(context);
                  //           },
                  //         style: TextUtils.linktext,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
