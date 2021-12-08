import 'package:flutter/material.dart';
import 'package:food/mealsdummy.dart';
class MealsDetail extends StatelessWidget {
  final Function fav;
  final Function isfav;
  MealsDetail(this.fav,this.isfav);
  @override
  Widget build(BuildContext context) {
    final mealid= ModalRoute.of(context)!.settings.arguments as String;
    final mealdata=DUMMY_MEALS.firstWhere((element) => 
    element.id.toString()==mealid
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(mealdata.title),
        centerTitle:true,
      ),
      body: SingleChildScrollView(
              child: Column(
          children: [
          Container(
            height: 250,
            width: double.infinity,
            child:Image.network(mealdata.imageUrl,fit: BoxFit.cover,),
          ),
          SizedBox(height:10),
          Container(
                child: Text('Ingredients',style: Theme.of(context).textTheme.title,),

          ),
          Container(
            margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(color: Colors.grey,
               borderRadius: BorderRadius.circular(5)),
            height: 150,
            width: 300,
            
              child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: mealdata.ingredients.length,
                itemBuilder: (context,index){
                  return Card(
elevation: 5,
child: Padding(
  padding: const EdgeInsets.all(4.0),
  child:   Text(mealdata.ingredients[index]),
),

                  );
                }),
            ),
              SizedBox(height:10),
          Container(
                child: Text('Steps',style: Theme.of(context).textTheme.title,),

          ),
             Container(
                margin: EdgeInsets.only(top: 5),
               decoration: BoxDecoration(color: Colors.grey,
               borderRadius: BorderRadius.circular(4)),
            height: 150,
            width: 300,
            
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 5,bottom:8,left:5,right:5),
                itemCount: mealdata.steps.length,
                itemBuilder: (context,index){
                  return Card(
elevation: 5,
child: Padding(
  padding: const EdgeInsets.all(5.0),
  child:  Row(children: [
 CircleAvatar(child:Center(child: Text("${index+1}"))),
 SizedBox(width: 5,),
 Expanded(
   child: Text(mealdata.steps[index],)),

  ],)
),

                  );
                }),
            ),

          
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isfav(mealid)?Icons.star:Icons.star_border),
        onPressed: ()=>fav(mealid),
        
      ),
    );
    
  }
}