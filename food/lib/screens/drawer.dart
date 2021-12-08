import 'package:flutter/material.dart';
class Draw extends StatelessWidget {
   Widget buildlist ( String title,IconData icon,Function() nav,BuildContext context){
     return  ListTile(
                leading:Icon(icon,size: 26,),
                title: Text(title,style: Theme.of(context).textTheme.title,),
                onTap: nav,
              );
   }
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child:Container(
      
        child:Column(
          children:[
            Container(
              height: 120,
              padding: EdgeInsets.all(25),
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.lightBlue,
              child: Text("Cookng Up",style:Theme.of(context).textTheme.title)),
              SizedBox(height:10),
              buildlist("Meals", Icons.restaurant, () => Navigator.of(context).pushReplacementNamed('/'), context),
              SizedBox(height:15),
                buildlist("Filter", Icons.settings, () => Navigator.of(context).pushReplacementNamed('filtered'), context),
              
          ]
        )
      )
    );
  }
}