import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        title: Text("Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Add your edit button action here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 120,
                    backgroundImage: AssetImage("assets/puppy.jpeg"),
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
