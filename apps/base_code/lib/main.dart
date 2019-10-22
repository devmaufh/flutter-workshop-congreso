import 'package:base_code/pages/favoritosPage.dart';
import 'package:base_code/pages/martePage.dart';
import 'package:base_code/utils/consts.dart';
import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Consts.darkBlue,
          title: Text('Mars Rover Photos', style: TextStyle(fontSize: 25),),
          elevation: 0,
        ),
        backgroundColor: Consts.darkBlue,
        body: _changePage(index),
        bottomNavigationBar: _buildNav(),

      ),
    );
  }

  Widget _buildNav(){
    return BottomNavigationBar(
      backgroundColor: Consts.darkBlue,
      currentIndex: index,
      onTap: (indexTap){
        setState(() {
         index = indexTap; 
        });
      },
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.bookmark, color: Colors.purple,),
          icon: Icon(Icons.bookmark_border, color: Consts.purple,),
          title: Text("Home",style: TextStyle(color: Colors.purple)),
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.favorite, color: Colors.purple,),
          icon: Icon(Icons.favorite_border, color: Consts.purple,),
          title: Text("Home",style: TextStyle(color: Colors.purple)),
        )
      ],
    );
  }

  Widget _changePage( int currentPage ){
    switch( currentPage ){
      case 0 : return MartePage();
      case 1 : return FavoritosPage();
      default: return MartePage();
    }
  }
}