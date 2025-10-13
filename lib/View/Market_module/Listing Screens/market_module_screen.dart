import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/reuse_textform.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/View/Market_module/Listing%20Screens/product_detail_screen.dart';

class MarketModuleScreen extends StatefulWidget {
  const MarketModuleScreen({super.key});

  @override
  State<MarketModuleScreen> createState() => _MarketModuleScreenState();
}

class _MarketModuleScreenState extends State<MarketModuleScreen> {
  final SearchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 10),
              ReuseTextForm(
                controller: SearchController, 
                hinttext: 'Search item here'
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7, // Adjusted for better card proportion
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product Image
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(8),
                              ),
                              child: Image.asset(
                                'assets/gtavice.png',
                                height: 140,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            
                            // Product Details
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'GTA Vice City',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                        '\$29.99',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                      SizedBox(height: 6,),
                                      GestureDetector(
                                        onTap: (){
                                          print('hello word');
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: AppColor.btnColor,
                                            borderRadius: BorderRadius.circular(6)
                                          ),
                                          child: Center(
                                            child: Text('Add to cart' ,style: TextStyle(color: Colors.white),),
                                          ),
                                        ),
                                      )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}