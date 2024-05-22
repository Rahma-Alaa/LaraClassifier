import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cart_screen.dart';
import 'menu_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lara Classifier',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    CartScreen(),
    ProfileScreen(),
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
              setState(() {
                _selectedIndex = 1;
              });
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
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
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
            child: SearchBar(),
          ),
          SectionTitle(title: 'Categories'),
          Container(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryCard('Automobiles', 'assets/icons/car.svg'),
                CategoryCard('Phones & Tablets', 'assets/icons/mobile.svg'),
                CategoryCard('Electronics', 'assets/icons/laptop.svg'),
                CategoryCard('Furniture & Appliances', 'assets/icons/sofa.svg'),
                CategoryCard('Real estate', 'assets/icons/real-state.svg'),
                CategoryCard('Animals & Pets', 'assets/icons/pets.svg'),
                CategoryCard('Fashion', 'assets/icons/fashion.svg'),
                CategoryCard('Beauty & Well being', 'assets/icons/beauty.svg'),
                CategoryCard('Jobs', 'assets/icons/jobs.svg'),
                CategoryCard('Services', 'assets/icons/services.svg'),
                CategoryCard('Learning', 'assets/icons/learning.svg'),
                CategoryCard('Local Events', 'assets/icons/Local Events.svg'),
              ],
            ),
          ),
          SectionTitle(title: 'Featured Products'),
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

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String iconPath;

  CategoryCard(this.categoryName, this.iconPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SvgPicture.asset(
            iconPath,
            height: 60,
            width: 60,
          ),
          SizedBox(height: 8.0),
          Text(
            categoryName,
            textAlign: TextAlign.center,
          ),
        ],
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
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            SvgPicture.asset(
              productImage,
              height: 60,
              width: 60,
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${productPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16, color: Color(0xFF3DBC24)),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.bookmark_border),
              onPressed: () {
                // Add bookmark functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}