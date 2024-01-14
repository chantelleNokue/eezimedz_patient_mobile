import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PreferredSize(
            preferredSize: Size.fromHeight(120.0),
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('John Doe'),
            subtitle: Text('johndoe@example.com'),
          ),
          ButtonBar(
            children: [
              Text("ghj"),
              Text("ghj"),
            ],
          ),
        ],
      ),
    );
  }
}
