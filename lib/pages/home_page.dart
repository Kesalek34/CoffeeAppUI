import 'package:coffeeappui/pages/util/coffee_tile.dart';
import 'package:coffeeappui/pages/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Add this import for GoogleFonts

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
 
 //list of coffee types
  final List coffeeType = [
    ['Cappuccino', true],
    ['Latte', true],
    ['Black', true],
     ['Tea', true],
  ];

 //user tapped on coffeee types
 void CoffeeTypeSelected(){

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue(
                 fontSize: 56,
              ), 
             
            ),
          ),
             SizedBox(height: 25),

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee...',
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade600)),
                  
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                     
                ),
               ),
             ),
    
     SizedBox(height: 25),

    Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,

        children:[
        CoffeeType(coffeeType: 'Cappuccino',
         isSelected: true,
         onTap: CoffeeTypeSelected,
         ),
        CoffeeType(coffeeType: 'Latte', 
        isSelected: true,
        onTap: CoffeeTypeSelected,),
        CoffeeType(coffeeType: 'Black',
         isSelected: true ,
         onTap: CoffeeTypeSelected,),
          
          SizedBox(width: 25,),],
      )  
      
       ),

     Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        
        children: [
       CoffeeTile(),
          
      ],          
      ),
    )    ],
      ),
    );  
  }
}