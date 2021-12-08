import 'package:flutter/material.dart';
import 'package:food/modals/me.dart';

import '../mealitem.dart';
class Favroutes extends StatelessWidget {
  final List<Meal> fav;
  Favroutes(this.fav);
  @override
  Widget build(BuildContext context) {
    if(fav.isEmpty){
    return Scaffold(
      appBar: AppBar(
        title:Text("Favriotes"),
        centerTitle:true
      ),
          body: Center(
        child:Text("You have no favriotes yet - Start adding some!")
      ),
      
    );}
    else{
      return Scaffold(
 appBar: AppBar(
        title:Text("Favriotes"),
        centerTitle:true
      ),
      body: ListView.builder(
      
        itemBuilder: (context,index){
          return MealItemss(
                id: fav[index].id,
                title: fav[index].title,
                imageurl: fav[index].imageUrl,
                complexity: fav[index].complexity,
                affordability: fav[index].affordability,
                duration: fav [index].duration,
                
              );
              
        },
          itemCount: fav.length,),
      );

    }
  }
}