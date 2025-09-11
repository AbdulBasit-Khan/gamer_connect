import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String btntitle;
  final String hint;
  const MyTextfield({super.key, required this.btntitle, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            btntitle,
            style: const TextStyle(fontSize: 16),
          ),
          TextFormField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: hint,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
          ),
        ],
      ),
    );
  }
}
