import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
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
