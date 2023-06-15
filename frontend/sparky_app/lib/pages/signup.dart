import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController likesController = TextEditingController();
  TextEditingController dislikesController = TextEditingController();

  double _currentAge = 18;

  @override 
  void dispose() {

    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    locationController.dispose();
    likesController.dispose();
    dislikesController.dispose();
    super.dispose();
  }

  void submitForm() async {
    String email = emailController.text;
    String password = passwordController.text;
    String name = nameController.text;
    double age = _currentAge;
    String location = locationController.text;
    String likes = likesController.text;
    String dislikes = dislikesController.text;

    // Change to make new user in database
    var url = Uri.parse('http://localhost:3000/signup');
    var headers = {'Content-Type': 'application/json'}; // Set headers
    var body = json.encode({'email': email, 'password': password, 'name': name, 'age': age.toString(), 'location': location, 'likes': likes, 'dislikes': dislikes}); // Encode body as JSON
    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // Signup successful
      Navigator.pushNamed(context, '/home');
    } else {
      // Something wrong
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sparky',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Create your profile',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Age',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Slider(
                    value: _currentAge,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: _currentAge.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentAge = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: locationController,
                    decoration: InputDecoration(
                      labelText: 'Location',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: likesController,
                    decoration: InputDecoration(
                      labelText: 'Likes',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: dislikesController,
                    decoration: InputDecoration(
                      labelText: 'Dislikes',
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: submitForm,
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}