import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Components/reuse_textform.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:google_fonts/google_fonts.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final pnameController = TextEditingController();
  final desController = TextEditingController();
  final priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
                  automaticallyImplyLeading: false,
        backgroundColor: AppColor.btnColor,
        title: Text(
          'Add Item',
          style: GoogleFonts.roboto(
    textStyle:TextStyle(fontSize: 20 , fontWeight: FontWeight.w800 , color: AppColor.whiteColor),
        ),),
                actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddItemScreen()));
          }, icon: const Icon(Icons.add , color: Colors.white,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,

          children: [
            SizedBox(height: media.height * 0.04,),
            ReuseTextForm(controller: pnameController, hinttext: 'Product Name'),
            SizedBox(height: media.height * 0.02,),
            TextFormField(
              maxLines: 6,
              style: TextStyle(color: AppColor.black),
              controller: desController,
              cursorColor: AppColor.whiteColor,
              decoration: InputDecoration(
                
                  // contentPadding:
                  //     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  labelText: 'Description',
                  
                  labelStyle: TextUtils.body16,
                   alignLabelWithHint: true, 
    floatingLabelAlignment: FloatingLabelAlignment.start, 
    contentPadding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                  border:OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)
                ),
                
                // fillColor: Colors.grey.shade300,
                // filled: true
          ),
            ),
            SizedBox(height: media.height * 0.02,),
            const Text(
              'Condition',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: media.height * 0.02,),
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    side: BorderSide(color: Colors.black , width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                  onPressed: () {}, child:const Text('New')),
                  SizedBox(width: media.width * 0.03,),
                TextButton(
                  style: TextButton.styleFrom(
                    side: BorderSide(color: Colors.black , width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                   onPressed: () {}, child:const Text('Used')),
              ],

            ),
            SizedBox(height: media.height * 0.01,),
            ReuseTextForm(controller: priceController, hinttext: 'Price'),
            SizedBox(height: media.height * 0.01,),
            const Text(
              'Images',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: media.height * 0.02,),
            Center(
              child: DottedBorder(
                // color: Colors.black, 
                // strokeWidth: 2, 
                // dashPattern: [6, 3],
                // borderType: BorderType.RRect,
                // radius:const Radius.circular(8),
                child: Container(
                  padding: EdgeInsets.all(25),
                  decoration:const BoxDecoration(),
                  child: Column(
                    children: [
                     const Text('Add Images'),
                     const Text('upload high-quality images of your item'),
                      TextButton(onPressed: () {}, child: Text('Upload'))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: media.height * 0.02,),
            Reusebtn(title: 'Add Item', ontap: (){
              
            })
          ],
        ),
      ),
    );
  }
}
