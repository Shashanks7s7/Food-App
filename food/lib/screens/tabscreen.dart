import 'package:flutter/material.dart';
import 'package:food/modals/me.dart';
import 'package:food/screens/categoris_screen.dart';

import 'drawer.dart';
import 'favroutes.dart';
class Bottomtab extends StatefulWidget {
  final List<Meal> favroite;
  Bottomtab(this.favroite);
  @override
  _BottomtabState createState() => _BottomtabState();
}

class _BottomtabState extends State<Bottomtab> {
  
   List<Widget> page=[];
  int select=0;
  @override
  void initState() {
    page=[ Categoris(),
    Favroutes(widget.favroite)];
    super.initState();
  }

  void selectpage( int index){
setState(() {
  select=index;
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Draw(),
      
           appBar: AppBar(
             title:Text("meals"),
             centerTitle: true,
           ),    
           body: page[select],
           bottomNavigationBar:BottomNavigationBar(
             backgroundColor: Theme.of(context).primaryColor,
             unselectedItemColor: Colors.white,
             selectedItemColor: Theme.of(context).accentColor,
             currentIndex: select,
           
             onTap: selectpage,
             items:[
            BottomNavigationBarItem(
             backgroundColor:Theme.of(context).primaryColor, 
             icon: Icon(Icons.category),
             title:Text('Categoris'), 
             
                 ),
                 BottomNavigationBarItem(
                   backgroundColor:Theme.of(context).primaryColor, 
                   title: Text('Favourates'),icon: Icon(Icons.star))]
           )
    );
  }
}