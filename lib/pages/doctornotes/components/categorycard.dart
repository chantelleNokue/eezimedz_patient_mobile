import 'package:flutter/material.dart';


class CategoryCard extends StatelessWidget{
  final colorVariable;
  final String? categoryVariable;
  final function;

  CategoryCard({
    this.categoryVariable,
    this.colorVariable,
    this.function,
});


  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 10,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: colorVariable,
        ),
        child: Center(
          child: Text(
            categoryVariable!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}