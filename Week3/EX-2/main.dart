import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container( 
      decoration: BoxDecoration(color: Colors.blue[300]),
      padding: const EdgeInsets.symmetric( horizontal: 50, vertical: 50),
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),

      child: Container(
        decoration: BoxDecoration(color: Colors.blue[600] ,  borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: const Center(
          child: Text('CADT Students Vong' , style: TextStyle(color: Colors.white, fontSize: 30,),),
        ),
      ),
    ),
  ));
}
