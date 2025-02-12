import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cart_screen.dart';
import 'category/automobiles_category.dart';
import 'category/beauty_category.dart';
import 'category/electronics_category.dart';
import 'category/estates_category.dart';
import 'category/events_category.dart';
import 'category/fashion_category.dart';
import 'category/furniture_category.dart';
import 'category/jobs_category.dart';
import 'category/learning_category.dart';
import 'category/pets_category.dart';
import 'category/phones_category.dart';
import 'category/services_category.dart';
import 'menu_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final Map<String, dynamic> userData;
  final String authToken;

  HomeScreen({required this.userData,required this.authToken});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomeContent(),
      CartScreen(),
      ProfileScreen(userData: widget.userData,
        authToken: widget.authToken,),
      MenuScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (AutomobilesCategory())),
                    );
                  },
                  child: CategoryCard('Automobiles', 'assets/icons/car.svg'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (PhonesCategory())),
                    );
                  },
                  child: CategoryCard('Phones & Tablets', 'assets/icons/mobile.svg'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (ElectronicsCategory())),
                    );
                  },
                  child: CategoryCard('Electronics', 'assets/icons/laptop.svg'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (FurnitureCategory())),
                    );
                  },
                  child: CategoryCard('Furniture & Appliances', 'assets/icons/sofa.svg'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (EstatesCategory())),
                    );
                  },
                  child: CategoryCard('Real estate', 'assets/icons/real-state.svg'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (PetsCategory())),
                    );
                  },
                  child: CategoryCard('Animals & Pets', 'assets/icons/pets.svg'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (FashionCategory())),
                    );
                  },
                  child: CategoryCard('Fashion', 'assets/icons/fashion.svg'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (BeautyCategory())),
                    );
                  },
                  child: CategoryCard('Beauty & Well being', 'assets/icons/beauty.svg'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (JobsCategory())),
                    );
                  },
                  child: CategoryCard('Jobs', 'assets/icons/jobs.svg'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (ServicesCategory())),
                    );
                  },
                  child: CategoryCard('Services', 'assets/icons/services.svg'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (LearningCategory())),
                    );
                  },
                  child: CategoryCard('Learning', 'assets/icons/learning.svg'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (EventsCategory())),
                    );
                  },
                  child: CategoryCard('Local Events', 'assets/icons/Local Events.svg'),
                ),
              ],
            ),
          ),
          SectionTitle(title: 'Featured Products'),
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
                hintText: 'What ?',
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
