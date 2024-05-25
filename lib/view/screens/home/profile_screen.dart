import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with default values
    _nameController = TextEditingController(text: 'lara classifier');
    _emailController = TextEditingController(text: 'lara.classifier@example.com');
  }

  @override
  void dispose() {
    // Dispose controllers when not needed
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Implement image editing functionality
              },
              child: SizedBox(
                height: 120.0,
                width: 120.0,
                child: SvgPicture.asset(
                  'assets/images/profile.svg',
                  placeholderBuilder: (BuildContext context) => CircularProgressIndicator(), // Placeholder widget while loading
                ),
              ),
            ),
            SizedBox(height: 25.0),
            _buildEditableField(
              labelText: 'Name',
              controller: _nameController,
            ),
            SizedBox(height: 25.0),
            _buildEditableField(
              labelText: 'Email',
              controller: _emailController,
            ),
            SizedBox(height: 32.0),
            _buildUpdateProfileButton(),
            SizedBox(height: 16.0),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField({required String labelText, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        cursorColor: Color(0xFF3DBC24),
        cursorErrorColor: Color(0xFF3DBC24),
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF3DBC24),),
          ),
          floatingLabelStyle: TextStyle(color: Color(0xFF3DBC24),),
        ),
      ),
    );
  }

  Widget _buildUpdateProfileButton() {
    return ElevatedButton(
      onPressed: () {
        String newName = _nameController.text;
        String newEmail = _emailController.text;
      },
      child: Text('Update Profile',style: TextStyle(color: Colors.black),),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF3DBC24),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement the logout logic
      },
      child: Text('Logout',style: TextStyle(color: Colors.black),),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      ),
    );
  }
}
