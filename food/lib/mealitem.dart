import 'package:flutter/material.dart';
import 'package:food/modals/me.dart';

class MealItemss extends StatelessWidget {
  final String id;
  final String title;
  final String imageurl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
   
  MealItemss(
      {required this.id,
        required this.title,
      required this.imageurl,
      required this.complexity,
      required this.affordability,
      required this.duration,
     });
  void select(BuildContext context) {
    Navigator.of(context).pushNamed('mealsdetailll',arguments: id)
    .then((value) { if (value!= null){
     // removeitems(value);
    }});
  }
  String get complextext {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "unknown";
    }
  }

  String get affordtext {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap:()=> select(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 11,
          margin: EdgeInsets.all(10),
          child: Column(children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imageurl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  color: Colors.black54,
                  width: 300,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: 26),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      Text("${duration.toString()} mins")
                    ],
                  ),
                  Row(
                    children: [Icon(Icons.work), Text(complextext)],
                  ),
                  Row(
                    children: [Icon(Icons.attach_money), Text(affordtext)],
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
