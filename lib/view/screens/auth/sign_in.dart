import 'package:flutter/material.dart';
import 'package:laraclassifier/view/screens/auth/sign_up.dart';
import '../../../api_service/api_login.dart';
import '../home/home_screen.dart';
import 'forgot_password.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}


class _SignInScreenState extends State<SignInScreen> {


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    try {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login successful')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $e')));
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
            Text('Sign In',
              style: TextStyle(color: Color(0xFF3DBC24),fontSize: 40),),

            SizedBox(height: 40.0),

            TextFormField(
              cursorColor: Color(0xFF3DBC24),
              cursorErrorColor: Color(0xFF3DBC24),
              controller: emailController,
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
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF3DBC24), width: 2.0),
                ),
                floatingLabelStyle: TextStyle(color: Color(0xFF3DBC24),),
              ),

            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                  );
                },
                child: Text('Forgot Password?',
                    style: TextStyle(color: Color(0xFF3DBC24),
                    )),
              ),
            ),
            SizedBox(height: 5.0),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3DBC24),
                ),

              onPressed: () async {
                final result = await login(emailController.text, passwordController.text);
                if( result["success"]) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login success')));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (HomeScreen(userData: result['result'], authToken: result['extra']['authToken'],)),
                    ),
                  );
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed')));
                }

              },

              child: Text('Sign In',
              style: TextStyle(color: Colors.black),),
            ),



            SizedBox(height: 10.0),
            Center(child: Text("----------------------- or -----------------------",
            style: TextStyle(color: Colors.grey[700]),)),
            SizedBox(height: 10.0),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(color: Color(0xFF3DBC24)),
                  ),
                ),

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
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
