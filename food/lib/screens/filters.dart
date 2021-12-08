import 'package:flutter/material.dart';
import 'package:food/screens/drawer.dart';
class Filter extends StatefulWidget {
  
  final Function savefilters;
final   Map<String,bool> currentFilters;
Filter(this.currentFilters,this.savefilters);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
 bool _isglutenfree=false;
   bool _islactosefree=false;
     bool _isvegan=false;
     bool _isvegeterian=false;

     

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Draw(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed:(){ 
           final  selectedfilters={
             ' gluten' :_isglutenfree,
             'lactose' : _islactosefree,
             'vegan':_isvegan,
             'vegeterian':_isvegeterian
            };
            widget.savefilters(selectedfilters);}, icon: Icon(Icons.save))
        ],
        title:Text("Your Filter"),
        centerTitle:true,
        
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Container(child: Text("Adjust Your Meal Selection",style: Theme.of(context).textTheme.title,)),
             Expanded(child: 
             ListView(children: [
               
               SwitchListTile(

                 title:Text ('Gluten Free'),
                 subtitle:Text('Only includes Gluten Free Meals'),
                 value:_isglutenfree,
                 onChanged:(val){ 
                   setState((){
                     _isglutenfree=val;
                   });
                 }
               ),
                SwitchListTile(
                 title:Text ('Lactose Free'),
                 subtitle:Text('Only includes Lactose Free Meals'),
                 value:_islactosefree,
                 onChanged:(val){ 
                   setState((){
                     _islactosefree=val;
                   });
                 }
               ),
                 SwitchListTile(
                 title:Text ('Vegan'),
                 subtitle:Text('Only includes Vegan Meals'),
                 value:_isvegan,
                 onChanged:(val){ 
                   setState((){
                     _isvegan=val;
                   });
                 }
               ),
                 SwitchListTile(
                 title:Text ('Vegetarian'),
                 subtitle:Text('Only includes Veg Meals'),
                 value:_isvegeterian,
                 onChanged:(val){ 
                   setState((){
                     _isvegeterian=val;
                   });
                 }
               ),
              

             ],))
             
           ],

      )
    );
  }
}