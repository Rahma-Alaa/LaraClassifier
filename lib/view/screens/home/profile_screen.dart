import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:laraclassifier/view/screens/auth/sign_in.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneController;
  File? _image;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'lara classifier');
    _emailController = TextEditingController(text: 'lara.classifier@example.com');
    _passwordController = TextEditingController(text: '***********');
    _phoneController = TextEditingController(text: '+971 52 **** ***');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _resetPassword() {
    // Implement the password reset logic here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reset Password'),
          content: Text('Password reset link has been sent to your email.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
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
              onTap: _pickImage,
              child: Stack(
                children: [
                  _image == null
                      ? SizedBox(
                    height: 120.0,
                    width: 120.0,
                    child: SvgPicture.asset(
                      'assets/images/profile.svg',
                      placeholderBuilder: (BuildContext context) => CircularProgressIndicator(), // Placeholder widget while loading
                    ),
                  )
                      : ClipOval(
                    child: Image.file(
                      _image!,
                      height: 120.0,
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.camera_alt,
                          color: Color(0xFF3DBC24),
                        ),
                      ),
                    ),
                  ),
                ],
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
            SizedBox(height: 25.0),
            _buildEditableField(
              labelText: 'Password',
              controller: _passwordController,
              obscureText: true,
              isPassword: true,
              onResetPassword: _resetPassword,
            ),
            SizedBox(height: 25.0),
            _buildEditableField(
              labelText: 'Phone',
              controller: _phoneController,
              keyboardType: TextInputType.number,
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

  Widget _buildEditableField({
    required String labelText,
    TextEditingController? controller,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    VoidCallback? onResetPassword,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        cursorColor: Color(0xFF3DBC24),
        cursorErrorColor: Color(0xFF3DBC24),
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        readOnly: isPassword, // Make the field read-only if it is the password field
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF3DBC24)),
          ),
          floatingLabelStyle: TextStyle(color: Color(0xFF3DBC24)),
          suffixIcon: isPassword
              ? TextButton(
            onPressed: onResetPassword,
            child: Text(
              'Reset Password',
              style: TextStyle(color: Color(0xFF3DBC24)),
            ),
          )
              : null,
        ),
      ),
    );
  }

  Widget _buildUpdateProfileButton() {
    return ElevatedButton(
      onPressed: () {
        String newName = _nameController.text;
        String newEmail = _emailController.text;
        String newPassword = _passwordController.text;
        String newPhone = _phoneController.text;
        // Implement profile update logic
      },
      child: Text('Update Profile', style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF3DBC24),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return ElevatedButton(
      onPressed: () {
        _showLogoutConfirmationDialog();
      },
      child: Text('Logout', style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      ),
    );
  }

  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: Text('Logout', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}
