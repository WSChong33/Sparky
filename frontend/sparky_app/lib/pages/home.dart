import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String username = "John Doe";
  String name = "Jane Smith";
  int age = 25;
  String location = "New York";
  List<String> likes = ["Reading", "Sports"];
  List<String> dislikes = ["Cooking", "Gardening"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Column(
          children: [
           Row(
            children: [
              SizedBox(width: 20), 
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hi $username",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/matches');
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                  ),
                  child: Text("Matches"),
                ),
              ),
              SizedBox(width: 20), // Add space to the right of the "Profile" button
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                  ),
                  child: Text("Profile"),
                ),
              ),
               SizedBox(width: 20), 
            ],
          ),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {},
                  ),
                  CircleAvatar(
                    radius: 120,
                    backgroundImage: AssetImage("assets/puppy.jpeg"),
                  ),
                  IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "$name, $age",
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    location,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "Likes:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    likes.join(", "),
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "Dislikes:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    dislikes.join(", "),
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
