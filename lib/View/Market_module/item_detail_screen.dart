import 'package:flutter/material.dart';
import 'package:gamerconnect/View/Market_module/payment_screen.dart';
import 'package:gamerconnect/View/Market_module/seller_contact_screen.dart';

class ItemDetailScreen extends StatefulWidget {
  final Map<String,String> item;
  const ItemDetailScreen({super.key, required this.item});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back , color: Colors.white,)),
        title: Text(widget.item['name']! , style: TextStyle(color: Colors.white),),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 3, 60, 106),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child:Image.network('https://www.google.com/imgres?q=computer%20laptop&imgurl=http%3A%2F%2Fdiscountstore.pk%2Fcdn%2Fshop%2Ffiles%2F6582845_sd.webp%3Fv%3D1754113357&imgrefurl=https%3A%2F%2Fdiscountstore.pk%2Fproducts%2Fmicrosoft-surface-laptop-7-copilot-pc-13-8-inch-touch-screen-snapdragon-x-plus-16gb-ram-512gb-ssd%3Fsrsltid%3DAfmBOoqlkuUB04oC81lOW02y5i_Em20yLkjsdbwPgpolTPXyUDGkVKp8&docid=gkopuW5IispOcM&tbnid=tBrbkCkSDqJJOM&vet=12ahUKEwico9r4wvSPAxVxnf0HHWUDOPsQM3oECB0QAA..i&w=600&h=600&hcb=2&ved=2ahUKEwico9r4wvSPAxVxnf0HHWUDOPsQM3oECB0QAA')
              ),
              SizedBox(height: 20,),
              Text('Price: ${widget.item['price']}'),
              SizedBox(height: 10,),
            Text('Seller: ${widget.item['seller']}'),
            Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SellerContactScreen(item: widget.item)));
              },
              child: Text('Contact Seller'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentScreen(item: widget.item)));
              },
              child: Text('Buy Now'),
            ),    
            ],
          )
          
          ],
        ),
      ),
    );
  
  }
}
