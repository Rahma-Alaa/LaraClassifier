import 'dart:convert';
import '../../../api_service/api_update_user.dart';
import '../../../api_service/api_logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:laraclassifier/view/screens/auth/sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:async/async.dart';

class ProfileScreen extends StatefulWidget {
  final Map<String, dynamic> userData;
  final String authToken;

  ProfileScreen({required this.userData, required this.authToken});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneController;
  String? _photoUrl;
  File? _image;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userData['name']);
    _emailController = TextEditingController(text: widget.userData['email']);
    _passwordController = TextEditingController(text: '***********');
    _phoneController = TextEditingController(text: widget.userData['phone']);
    _photoUrl = widget.userData['photo_url'].replaceAll("localhost","10.0.2.2");

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
        _uploadImage(_image!);
      }
    });
  }

  Future<void> _uploadImage(File image) async {
    var stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
    var length = await image.length();

    var uri = Uri.parse('http://10.0.2.2/storage/app/default/user.png'); // Replace with your API endpoint

    var request = http.MultipartRequest("POST", uri);
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: path.basename(image.path));

    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      response.stream.transform(utf8.decoder).listen((value) {
        setState(() {
          _photoUrl = value; // Update the photo URL from the server response
        });
      });
    } else {
      // Handle error
    }
  }

  Future<void> _logoutUser(int userId) async {
    try {

      final response = await logoutUser(userId, widget.authToken);
      print(response);
      // Call the logoutUser method
      if (response['success']) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignInScreen()),
        );
      } else {
        // Handle unsuccessful logout
        print('Logout failed: ${response['message']}');
      }
    } catch (e) {
      // Handle exception
      print('Logout failed: $e');
    }
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
                  _image == null && _photoUrl != null
                      ? SizedBox(
                    height: 120.0,
                    width: 120.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(_photoUrl!),
                    ),
                  )
                      : _image != null
                      ? ClipOval(
                    child: Image.file(
                      _image!,
                      height: 120.0,
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                  )
                      : SizedBox(
                    height: 120.0,
                    width: 120.0,
                    child: SvgPicture.asset(
                      'assets/images/profile.svg',
                      placeholderBuilder: (BuildContext context) =>
                          CircularProgressIndicator(),
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
        readOnly: isPassword,
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
        updateUser(widget.userData['id'], newEmail,newName,newPhone);
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
                Navigator.of(context).pop();
                _logoutUser(widget.userData['id']);
              },
              child: Text('Logout', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}
