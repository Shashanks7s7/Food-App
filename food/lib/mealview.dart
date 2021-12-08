import 'package:flutter/material.dart';
import 'package:food/mealitem.dart';

import 'package:food/modals/me.dart';

class MealView extends StatefulWidget {
 final List<Meal> available;
 MealView(this.available);
  @override
  _MealViewState createState() => _MealViewState();
}

class _MealViewState extends State<MealView> {
    String cattitle='';
  List<Meal> categorymeal=[];
  Color catcolor= Colors.black; 
  @override
  void didChangeDependencies() {
 

    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    cattitle = routeArg['title'];
    final catid = routeArg['id'];
    catcolor = routeArg['color'];
    categorymeal =widget.available
        .where((element) => element.categories.contains(catid))
        .toList();

    super.didChangeDependencies();
  }

  void _removemeals(String mealid) {
    setState(() {
      categorymeal.removeWhere((element) => element.id == mealid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(cattitle == null ? "no title" : cattitle),
          centerTitle: true,
          backgroundColor: catcolor,
        ),
        body: ListView.builder(
            itemCount: categorymeal.length,
            itemBuilder: (context, index) {
              return MealItemss(
                id: categorymeal[index].id,
                title: categorymeal[index].title,
                imageurl: categorymeal[index].imageUrl,
                complexity: categorymeal[index].complexity,
                affordability: categorymeal[index].affordability,
                duration: categorymeal[index].duration,
               
              );
            }));
  }
}
