import 'package:flutter/material.dart';
import 'package:food/mealsdummy.dart';


import 'package:food/mealview.dart';
import 'package:food/screens/filters.dart';
import 'package:food/screens/tabscreen.dart';


import 'modals/me.dart';
import 'screens/mealsdetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
   'gluten':false,
   'lactose':false,
    'vegan':false,
   'vegetarian':false,
};
List<Meal> _favriotesmeal=[];
List<Meal> _availablemeals=DUMMY_MEALS;
void _setfilters(Map<String,bool> filterdata){

setState(() {
  _filters=filterdata;

  _availablemeals=DUMMY_MEALS.where((meal) {
    if (_filters['gluten']==true && !meal.isGlutenFree){
      return false;
    }
     if (_filters['lactose'] ==true && !meal.isLactoseFree){
      return false;}
       if (_filters['vegan']==true && !meal.isVegan){
      return false;
       }
        if (_filters['vegeterian']==true && !meal.isVegetarian){
      return false;}
      return true;
   } ).toList();
});

}
void toggalefav(String id){
final existing=  _favriotesmeal.indexWhere((meal) => meal.id==id);
if(existing >=0){
  setState(() {
    _favriotesmeal.removeAt(existing);
  });
}
else{
  setState(() {
    _favriotesmeal.add(DUMMY_MEALS.firstWhere((element) => element.id==id));
  });
}
}
bool isfav(String id){
  return _favriotesmeal.any((element) => element.id==id);
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 2)
          ),
          title: TextStyle(fontSize: 22,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold)
        )
      ),
      home:Bottomtab(_favriotesmeal),
      routes: {
     
        'category-meals':(context)=>MealView(_availablemeals),
        'mealsdetailll' :(context)=> MealsDetail(toggalefav,isfav),
        'filtered':(context)=> Filter(_filters,_setfilters,),

      },
    );
  }
}


