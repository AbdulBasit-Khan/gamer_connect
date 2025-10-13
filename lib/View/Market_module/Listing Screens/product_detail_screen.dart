import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/View/Market_module/Listing%20Screens/user_communication_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        title: Text('Product detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              child: Image.asset('assets/ts.png')),
              SizedBox(height: 10,),
              Text('Product Name' , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
              SizedBox(height: 4,),
              Text('\$66' , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold , color: AppColor.btnColor),),
              SizedBox(height: 4,),
              Text('moving to the actions (methods), and finally detailing the testing process itself. It will provide a very solid foundation for your audience. Good luck' , style: TextStyle(fontSize: 18 ,  ),),
              Divider(),
              Text('Seller Information' , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
              SizedBox(height: 4,),
             Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.deepPurple,
                ),
                SizedBox(width: 10,),
                Text('Username' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w500),)
              ],
             ),
             SizedBox(height: 10,),
             Reusebtn(title: 'Chat with seller', ontap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> UserCommunicationScreen()));
             }),
             SizedBox(height: 10,),
             Reusebtn(title: 'Buy Now', ontap: (){}),
          ],
        ),
      ),
    );
  }
}