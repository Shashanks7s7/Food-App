import 'package:flutter/material.dart';
import 'package:food/screens/categoryitem.dart';
import 'package:food/dummy_data.dart';




class Categoris extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
     // drawer: Draw(),
      
     // appBar: AppBar(
        //title: const Text('Food App'),
       // centerTitle: true,

      //),
      
       body: GridView(
          padding: EdgeInsets.all(25),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3/2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          children: DUMMY_CATEGORIES.map((e) => 
                CategoryItem(e.id,e.title,e.color)
          ).toList()
          
             
           
          
      
       )
       );
  }
}