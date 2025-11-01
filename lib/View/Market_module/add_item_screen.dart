import 'package:flutter/material.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/providers/seller_product_pro.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddItemScreen extends StatefulWidget {
  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final nameCtrl = TextEditingController();

  final categCtrl = TextEditingController();

  final priceCtrl = TextEditingController();

  final descCtrl = TextEditingController();

  List<XFile> images = [];
  final fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Item')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: fKey,
            child: Column(
              children: [
                TextFormField(
                  // obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Item Name is required';
                    }

                    return null;
                  },

                  style: TextStyle(color: AppColor.black),
                  controller: nameCtrl,
                  cursorColor: AppColor.black,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    labelText: 'Item Name',

                    labelStyle: TextUtils.body16,
                    // suffixIcon: Icon(Icons.name, color: AppColor.black),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),

                    fillColor: Colors.grey.shade300,
                    filled: true,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  // obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Category is required';
                    }

                    return null;
                  },

                  style: TextStyle(color: AppColor.black),
                  controller: categCtrl,
                  cursorColor: AppColor.black,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    labelText: 'Item Category',

                    labelStyle: TextUtils.body16,
                    // suffixIcon: Icon(Icons.name, color: AppColor.black),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),

                    fillColor: Colors.grey.shade300,
                    filled: true,
                  ),
                ),
                SizedBox(height: 10),

                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a number';
                    }

                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Only digits are allowed';
                    }

                    if (value.length > 1 && value.startsWith('0')) {
                      return 'Number should not have leading zeros';
                    }

                    final intValue = int.tryParse(value);
                    if (intValue == null || intValue <= 0) {
                      return 'Enter a positive non-zero number';
                    }

                    return null;
                  },

                  style: TextStyle(color: AppColor.black),
                  controller: priceCtrl,
                  cursorColor: AppColor.black,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    labelText: 'Item Price',

                    labelStyle: TextUtils.body16,
                    // suffixIcon: Icon(Icons.name, color: AppColor.black),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),

                    fillColor: Colors.grey.shade300,
                    filled: true,
                  ),
                ),
                SizedBox(height: 10),

                TextFormField(
                  maxLines: 4,
                  // obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description is required';
                    }

                    return null;
                  },

                  style: TextStyle(color: AppColor.black),
                  controller: descCtrl,
                  cursorColor: AppColor.black,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    labelText: 'Item Description',

                    labelStyle: TextUtils.body16,
                    // suffixIcon: Icon(Icons.name, color: AppColor.black),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),

                    fillColor: Colors.grey.shade300,
                    filled: true,
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    ImagePicker picker = ImagePicker();
                    images = await picker.pickMultiImage();
                    setState(() {});
                  },
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: images.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.image),
                                Text("Upload Images"),
                              ],
                            ),
                          )
                        : Center(child: Text("Images Uploaded")),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (fKey.currentState!.validate()) {
                      if (images.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please upload atleast one image"),
                          ),
                        );
                      } else {
                        Provider.of<SellerProductPro>(
                          context,
                          listen: false,
                        ).addProduct(
                          context: context,
                          name: nameCtrl.text,
                          price: int.parse(priceCtrl.text),
                          description: descCtrl.text,
                          categ: categCtrl.text,
                          images1: images,
                        );
                      }
                    }
                  },
                  child: Text('Submit Item'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
