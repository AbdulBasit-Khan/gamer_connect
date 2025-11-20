import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:gamerconnect/Models/product_model.dart';
import 'package:gamerconnect/providers/order_pro.dart';
import 'package:provider/provider.dart';

class CreditCardInputScreen extends StatefulWidget {
  final ProductModel product;
  final String name;
  final String phone;
  final String address;
  final int count;
  const CreditCardInputScreen({
    super.key,
    required this.name,
    required this.product,
    required this.count,
    required this.phone,
    required this.address,
  });

  @override
  State<CreditCardInputScreen> createState() => _CreditCardInputScreenState();
}

class _CreditCardInputScreenState extends State<CreditCardInputScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Card Details')),
      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              onCreditCardWidgetChange: (val) {},
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused, // flip card
              obscureCardNumber: false,
              obscureCardCvv: false,
              height: 200,
              width: MediaQuery.of(context).size.width,
              animationDuration: const Duration(milliseconds: 600),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: CreditCardForm(
                  formKey: formKey,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: onModelChange,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  // isCardHolderNameVisible: true,
                  // isCvvVisible: true,
                  // cardNumberDecoration: const InputDecoration(
                  //   labelText: 'Card Number',
                  //   hintText: 'XXXX XXXX XXXX XXXX',
                  //   border: OutlineInputBorder(),
                  // ),
                  // expiryDateDecoration: const InputDecoration(
                  //   labelText: 'Expiry Date',
                  //   hintText: 'MM/YY',
                  //   border: OutlineInputBorder(),
                  // ),
                  // cvvCodeDecoration: const InputDecoration(
                  //   labelText: 'CVV',
                  //   hintText: 'XXX',
                  //   border: OutlineInputBorder(),
                  // ),
                  // cardHolderDecoration: const InputDecoration(
                  //   labelText: 'Card Holder',
                  //   border: OutlineInputBorder(),
                  // ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (cardNumber == "4242 4242 4242 4242") {
                    final stripeMakePayment = {
                      "cardNumber": cardNumber,
                      "cvv": cvvCode,
                    };
                    final emptyPaymentSheet = SetupPaymentSheetParameters(
                      merchantDisplayName: "Test",
                    );
                    Provider.of<OrderPro>(context, listen: false).placeOrder(
                      name: widget.name,
                      count: widget.count,
                      address: widget.address,
                      phone: widget.phone,
                      context: context,
                      model: widget.product,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please use test stripe card")),
                    );
                  }
                } else {
                  debugPrint('Invalid Card Details');
                }
              },
              child: const Text("Submit"),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void onModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      expiryDate = data.expiryDate;
      cardHolderName = data.cardHolderName;
      cvvCode = data.cvvCode;
      isCvvFocused = data.isCvvFocused;
    });
  }
}
