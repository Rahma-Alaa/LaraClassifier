import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 30,),
          ListTile(
            leading: Icon(Icons.settings, size: 30,),
            title: Text('Settings',style: TextStyle(fontSize: 20),),
            onTap: () {
            },
          ),

         SizedBox(height: 10,),

          ListTile(
            leading: Icon(Icons.info, size: 30,),
            title: Text('About',style: TextStyle(fontSize: 20),),
            onTap: () {
              // Navigate to about screen
            },
          ),

          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.help,size: 30,),
            title: Text('Help',style: TextStyle(fontSize: 20),),
            onTap: () {
              // Navigate to help screen
            },
          ),

          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.feedback, size: 30,),
            title: Text('Feedback',style: TextStyle(fontSize: 20),),
            onTap: () {
              // Navigate to feedback screen
            },
          ),
        ],
      ),
    );
  }
}
