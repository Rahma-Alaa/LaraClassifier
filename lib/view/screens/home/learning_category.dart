import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cart_screen.dart';
import 'menu_screen.dart';
import 'profile_screen.dart';

class LearningCategory extends StatefulWidget {
  @override
  _LearningCategoryState createState() => _LearningCategoryState();
}

class _LearningCategoryState extends State<LearningCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Lara',
              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3DBC24)),
            ),
            Text(
              'Classifier',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Color(0xFF3DBC24)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SearchBar(),
          ),
          SizedBox(height: 8,),
          SectionTitle(title: 'Learning Category'),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1, // Adjust aspect ratio to fit image and text
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              return ProductCard('Product ${index + 1}', 'assets/images/product1.svg', 19.99 + index * 10);
            },
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 55.0,
            child: const TextField(
              cursorColor: Color(0xFF3DBC24),
              decoration: InputDecoration(
                hintText: 'What',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  borderSide: BorderSide(width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  borderSide: BorderSide(color: Color(0xFF3DBC24), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                prefixIcon: Icon(Icons.keyboard_double_arrow_right_outlined),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 55.0,
            child: TextField(
              cursorColor: Color(0xFF3DBC24),
              decoration: InputDecoration(
                hintText: 'Where',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Color(0xFF3DBC24), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
          ),
        ),
        Container(
          height: 55.0,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF3DBC24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                side: BorderSide(color: Color(0xFF3DBC24)),
              ),
            ),
            onPressed: () {
              // Add your onPressed code here!
            },
            icon: Icon(Icons.search, color: Colors.white),
            label: Text(
              'Find',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String productImage;
  final double productPrice;

  ProductCard(this.productName, this.productImage, this.productPrice);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 220,
        child: Card(
          margin: EdgeInsets.all(8.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    productImage,
                    height: 100,
                    width: 100,
                  ),
                ),
                //SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    Text(
                      productName,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.bookmark_border),
                      onPressed: () {
                        // Add bookmark functionality here
                      },
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    '\$${productPrice.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3DBC24)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
