import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    ProfileScreen(),
    CartScreen(),
    MenuScreen(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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

            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF3DBC24),
        unselectedItemColor: Colors.grey[400],
        onTap: _onItemTapped,
      ),
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
              child: Row(
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
              )
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 120, // Increased height to accommodate SVG
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryCard('Automobiles', 'assets/icons/car.svg'),
                CategoryCard('Phones & Tablets', 'assets/icons/mobile.svg'),
                CategoryCard('Electronics', 'assets/icons/laptop.svg'),
                CategoryCard('Furniture & Appliances', 'assets/icons/pets.svg'),
                CategoryCard('Real estate', 'assets/icons/pets.svg'),
                CategoryCard('Animals & Pets', 'assets/icons/pets.svg'),
                CategoryCard('Fashion', 'assets/icons/pets.svg'),
                CategoryCard('Beauty & Well being', 'assets/icons/pets.svg'),
                CategoryCard('Jobs', 'assets/icons/pets.svg'),
                CategoryCard('Services', 'assets/icons/pets.svg'),
                CategoryCard('Learning', 'assets/icons/pets.svg'),
                CategoryCard('Local Events', 'assets/icons/Local Events.svg'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Featured Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ProductCard('Product 1', 'assets/images/product1.svg', 29.99),
          ProductCard('Product 2', 'assets/images/product1.svg', 59.99),
          ProductCard('Product 3', 'assets/images/product1.svg', 19.99),
          ProductCard('Product 4', 'assets/images/product1.svg', 19.99),
          ProductCard('Product 5', 'assets/images/product1.svg', 19.99),
          ProductCard('Product 6', 'assets/images/product1.svg', 19.99),
          ProductCard('Product 7', 'assets/images/product1.svg', 19.99),
          ProductCard('Product 8', 'assets/images/product1.svg', 19.99),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String svgPath;

  CategoryCard(this.categoryName, this.svgPath);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SvgPicture.asset(
              svgPath,
              width: 50,
              height: 50,
            ),
            SizedBox(height: 8.0),
            Text(categoryName),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String svgPath;
  final double price;

  ProductCard(this.productName, this.svgPath, this.price);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Row(
          children: [
            SvgPicture.asset(svgPath, width: 100, height: 100),
            SizedBox(width: 36.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3DBC24)),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.bookmark_border),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen', style: TextStyle(fontSize: 24)),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Cart Screen', style: TextStyle(fontSize: 24)),
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Menu Screen', style: TextStyle(fontSize: 24)),
    );
  }
}
