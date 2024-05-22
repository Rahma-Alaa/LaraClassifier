import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CartItem('Product 1', 29.99),
          CartItem('Product 2', 59.99),
          CartItem('Product 3', 19.99),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Add checkout functionality here
          },
          child: Text('Checkout',style: TextStyle(color: Colors.black),
          ),


          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF3DBC24),
            //textStyle: TextStyle(color: Colors.black)
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String itemName;
  final double itemPrice;

  CartItem(this.itemName, this.itemPrice);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              itemName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${itemPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, color: Color(0xFF3DBC24)),
            ),
            IconButton(
              icon: Icon(Icons.remove_circle_outline,color: Colors.red[800],),
              onPressed: () {
                // Add remove item functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
