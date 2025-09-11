import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  final  IconData icondata;
  final String iconName;
  final VoidCallback onTap;
  const DrawerComponent({super.key, required this.icondata, required this.iconName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
              onTap: onTap,
              leading: Icon(icondata , size: 30,color: Colors.black,),
              title: Text(iconName , style:const
               TextStyle(color: Colors.black),),
            );
  }
}