import 'package:flutter/material.dart';

import '../../../api_service/api_login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _signUp() async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign Up successful')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign Up failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Sign Up',
              style: TextStyle(color: Color(0xFF3DBC24),fontSize: 40),),

            SizedBox(height: 40.0),

            TextFormField(
              cursorColor: Color(0xFF3DBC24),
              cursorErrorColor: Color(0xFF3DBC24),
              decoration: InputDecoration(
                labelText: 'Name',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF3DBC24), width: 2.0),
                ),
                floatingLabelStyle: TextStyle(color: Color(0xFF3DBC24),),
              ),

            ),
            SizedBox(height: 20.0),
            TextFormField(
              cursorColor: Color(0xFF3DBC24),
              cursorErrorColor: Color(0xFF3DBC24),
              decoration: InputDecoration(
                labelText: 'Email',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF3DBC24), width: 2.0),
                ),
                floatingLabelStyle: TextStyle(color: Color(0xFF3DBC24),),
              ),

            ),
            SizedBox(height: 20.0),
            TextFormField(
              cursorColor: Color(0xFF3DBC24),
              cursorErrorColor: Color(0xFF3DBC24),
              decoration: InputDecoration(
                labelText: 'Password',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF3DBC24), width: 2.0),
                ),
                floatingLabelStyle: TextStyle(color: Color(0xFF3DBC24),),
              ),

            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3DBC24),
              ),

              onPressed: () {
              },

              child: Text('Sign Up',
                style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}
