import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCardInputScreen extends StatefulWidget {
  const CreditCardInputScreen({super.key});

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
      appBar: AppBar(
        title: const Text('Enter Card Details'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              onCreditCardWidgetChange:(val){},
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
                  debugPrint('Valid Card Details');
                  debugPrint('Card Number: $cardNumber');
                  debugPrint('Expiry: $expiryDate');
                  debugPrint('Holder: $cardHolderName');
                  debugPrint('CVV: $cvvCode');

                  // Now you can send card data to your backend / dummy logic
                } else {
                  debugPrint('Invalid Card Details');
                }
              },
              child: const Text("SUBMIT"),
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
