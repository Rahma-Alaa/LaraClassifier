import 'package:flutter/material.dart';

import '../../../api_service/api_login.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final TextEditingController emailController = TextEditingController();

  Future<void> _resetPassword() async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password reset email sent')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to reset password: $e')));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password',style: TextStyle(color: Color(0xFF3DBC24)),),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

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
            SizedBox(height: 30.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3DBC24),
              ),
              onPressed: () {},
              child: Text('Reset Password',
                style: TextStyle(color: Colors.black,)),
            ),
          ],
        ),
      ),
    );
  }
}
