import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/reuse_textform.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/View/Market_module/Listing%20Screens/product_detail_screen.dart';
import 'package:gamerconnect/providers/chatbot_pro.dart';
import 'package:gamerconnect/providers/products_pro.dart';
import 'package:provider/provider.dart';

class MarketModuleScreen extends StatefulWidget {
  const MarketModuleScreen({super.key});

  @override
  State<MarketModuleScreen> createState() => _MarketModuleScreenState();
}

class _MarketModuleScreenState extends State<MarketModuleScreen> {
  final SearchController = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((val) {
      Provider.of<ProductsPro>(
        context,
        listen: false,
      ).getProducts(context: context);
      Provider.of<ChatbotPro>(
        context,
        listen: false,
      ).sendChatRequest(prompt: "Hi");
    });
    super.initState();
  }

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
                hinttext: 'Search item here',
              ),
              SizedBox(height: 10),

              Expanded(
                child: Consumer<ProductsPro>(
                  builder: (context, pro, child) {
                    return pro.isLoadingProducts
                        ? Center(child: CircularProgressIndicator())
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio:
                                      0.9, // Adjusted for better card proportion
                                ),
                            itemCount: pro.products.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailScreen(
                                        model: pro.products[index],
                                      ),
                                    ),
                                  );
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Product Image
                                      ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(8),
                                        ),
                                        child: Image.network(
                                          pro.products[index].images[0]
                                              .toString(),
                                          height: 140,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                      // Product Details
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              pro.products[index].name,
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
                                              '\$${pro.products[index].price}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.deepPurple,
                                              ),
                                            ),
                                            // SizedBox(height: 6),
                                            // GestureDetector(
                                            //   onTap: () {
                                            //     print('hello word');
                                            //   },
                                            //   child: Container(
                                            //     width: double.infinity,
                                            //     height: 40,
                                            //     decoration: BoxDecoration(
                                            //       color: AppColor.btnColor,
                                            //       borderRadius:
                                            //           BorderRadius.circular(6),
                                            //     ),
                                            //     child: Center(
                                            //       child: Text(
                                            //         'Add to cart',
                                            //         style: TextStyle(
                                            //           color: Colors.white,
                                            //         ),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
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
