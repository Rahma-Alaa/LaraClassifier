import 'package:flutter/material.dart';
import 'sign_in.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: PageView(

          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: <Widget>[
            buildOnboardingPage('Welcome to our app!', 'assets/images/onboarding1.png'),
            buildOnboardingPage('Buy from around the world!', 'assets/images/onboarding2.png'),
            buildOnboardingPage('Start order now!', 'assets/images/onboarding3.png'),
          ],
        ),
      ),
      bottomSheet: _currentIndex == 2
          ? Container(
        padding: EdgeInsets.only(bottom: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.0),
            color: Colors.white,
            border: Border.all(color: Colors.white),
          ),
            child: ElevatedButton(

              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3DBC24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                elevation: 0,

                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                minimumSize: Size(150, 50),

              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SignInScreen()));
             },



                child: Text('Get Started', style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
          )
          : Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        height: 80.0,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              onPressed: () {
                _pageController.jumpToPage(2);
              },
              child: Text('Skip', style: TextStyle(color: Colors.black, fontSize: 20),),
            ),
            Row(
              children: List.generate(
                3,
                    (index) => buildDot(index, context),
              ),
            ),
            TextButton(
              onPressed: () {
                _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
              },
              child: Text('Next', style: TextStyle(color: Color(0xFF3DBC24),  fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnboardingPage(String text, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(imagePath),
        SizedBox(height: 20),
        Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: 13,
      width: 13,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? Color(0xFF3DBC24) : Colors.grey,
      ),
    );
  }
}
