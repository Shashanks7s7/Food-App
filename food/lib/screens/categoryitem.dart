import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  void route(BuildContext con){
     Navigator.of(con).pushNamed('category-meals',arguments:{'id':id,'title':title,'color': color })
     ;
  }

   CategoryItem(this.id, this.title, this.color) ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      
         onTap: ()=>route(context),
         splashColor:Theme.of(context).primaryColor ,
         borderRadius: BorderRadius.circular(10),
          child: Container(
        
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(begin:Alignment.topLeft ,colors: [color.withOpacity(0.6),color],end:Alignment.bottomRight )
        ,borderRadius: BorderRadius.circular(10)
        ),

        child: Text(title,style:Theme.of(context).textTheme.title,),
        
      ),
    );
  }
}