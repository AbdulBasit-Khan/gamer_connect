import 'package:flutter/material.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/View/Vender_Verification_Screens/add_item_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class VenderDashboard extends StatefulWidget {
  const VenderDashboard({super.key});

  @override
  State<VenderDashboard> createState() => _VenderDashboardState();
}

class _VenderDashboardState extends State<VenderDashboard> {
  @override
  Widget build(BuildContext context) {
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
          'Dashboard',
          style: GoogleFonts.roboto(
    textStyle:TextStyle(fontSize: 20 , fontWeight: FontWeight.w800 , color: AppColor.whiteColor),
        ),),
                actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddItemScreen()));
          }, icon: const Icon(Icons.add , color: Colors.white,))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              /// Sales Summary Row
            const  Row(
                children: [
                  Expanded(
                    child: Card(
                      child: ListTile(
                        title:  Text('Total Sales'),
                        subtitle: Text(
                          '21',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: ListTile(
                        title: Text('Total Orders'),
                        subtitle: Text(
                          '12',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Current Listings Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Current Listings',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See More'),
                  ),
                ],
              ),

              /// Listing Items
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Item ${index + 1}'),
                      subtitle: const Text('Details of the item'),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
