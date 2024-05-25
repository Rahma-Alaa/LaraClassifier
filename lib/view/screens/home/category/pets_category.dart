import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cart_screen.dart';

class PetsCategory extends StatefulWidget {
  @override
  _PetsCategoryState createState() => _PetsCategoryState();
}

class _PetsCategoryState extends State<PetsCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
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
          SectionTitle(title: 'Pets Category'),
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

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _selectedCategory = 'All Category';
  final List<String> _categories = ['All Category', 'Category 1', 'Category 2', 'Category 3', 'Category 4','Category 5', 'Category 6', 'Category 7', 'Category 8']; // Add your categories here

  void navigateToCategory(String category) {
    // Implement navigation logic based on the selected category
    switch (category) {
      case 'Category 1':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PetsCategory()),
        );
    //break;
      case 'Category 2':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PetsCategory()),
        );
        break;
    // Add cases for other categories
      default:
      // Handle other categories
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width:0.3,),
        Expanded(
          flex: 3,
          child: Container(
            height: 58.0,
            child: DropdownButtonFormField(
              value: _selectedCategory,
              items: _categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue.toString();
                });
              },
              decoration: InputDecoration(
                hintText: 'All Category',
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
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 58.0,
            child: const TextField(
              cursorColor: Color(0xFF3DBC24),
              decoration: InputDecoration(
                hintText: 'What ?',
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
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 58.0,
            child: TextField(
              cursorColor: Color(0xFF3DBC24),
              decoration: InputDecoration(
                hintText: 'Where ?',
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
              ),
            ),
          ),
        ),
        Container(
          height: 58.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            color: Color(0xFF3DBC24),
            border: Border.all(color: Color(0xFF3DBC24)),
          ),
          child: InkWell(
            onTap: () {
              // Add your onPressed code here!
            },
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 15), // Adjust padding as needed
              child: Icon(Icons.search, color: Colors.white),
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
