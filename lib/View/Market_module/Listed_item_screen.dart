import 'package:flutter/material.dart';
import 'package:market_module/Market_module/item_detail_screen.dart';
import 'package:market_module/Market_module/seller_verification_screen.dart';

class ListedItemScreen extends StatefulWidget {
  const ListedItemScreen({super.key});

  @override
  State<ListedItemScreen> createState() => _ListedItemScreenState();
}

class _ListedItemScreenState extends State<ListedItemScreen> {
    final List<Map<String, String>> items = [
    {'name': 'MacBook Pro', 'price': 'Rs. 250,000', 'seller': 'John Doe'},
    {'name': 'iPhone 13', 'price': 'Rs. 180,000', 'seller': 'John Doe'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Marketplace' , style: TextStyle(color: Colors.white),),
      
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 3, 60, 106),
      actions: [IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> SellerVerificationScreen()));
      }, icon:Icon(Icons.person , color: Colors.white,) 
      )],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) {
          final item = items[index];
          return Card(
            child: ListTile(
              leading: ClipRRect(
                child: Text(index.toString()),
              ),
              title: Text('${item['name']} '),
             subtitle: Text('${item['price']}'),
              trailing: Text(
                
                '${item['seller']}'),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=> ItemDetailScreen(item: item)));
              },
            ),
          );
        },
      ),
    );
  }
}