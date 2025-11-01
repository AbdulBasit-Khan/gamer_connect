import 'package:flutter/material.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';

class SellerVerificationPending extends StatefulWidget {
  const SellerVerificationPending({super.key});

  @override
  State<SellerVerificationPending> createState() =>
      _SellerVerificationPendingState();
}

class _SellerVerificationPendingState extends State<SellerVerificationPending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.btnColor,
        title: Text("", style: TextUtils.heading2),
        centerTitle: true,
      ),
      body: Center(child: Text("Verification Pending")),
    );
  }
}
