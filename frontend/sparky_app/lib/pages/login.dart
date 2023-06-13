import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override 
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submitForm() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email == "weishen33@gmail.com" && password == "123") {
      Navigator.pushNamed(context, '/home');
    }

    // Add your logic for further processing the email and password here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
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
                    Text(
                      'Finding your "fur"-ever friends',
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
            flex: 5,
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
                  SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: submitForm,
                    child: Text('Login / Signup'),
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
