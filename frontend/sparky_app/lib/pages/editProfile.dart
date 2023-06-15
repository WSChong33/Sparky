import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController likesController = TextEditingController();
  TextEditingController dislikesController = TextEditingController();

  double _currentAge = 18;

  late String email;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    email = ModalRoute.of(context)?.settings.arguments as String;
  }

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    likesController.dispose();
    dislikesController.dispose();
    super.dispose();
  }

  void saveProfile() async {
    String name = nameController.text;
    String age = _currentAge.toString();
    String location = locationController.text;
    String likes = likesController.text;
    String dislikes = dislikesController.text;

    var url = Uri.parse('http://localhost:3000/editProfile');
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({'email': email, 'name': name, 'age': age.toString(), 'location': location, 'likes': likes, 'dislikes': dislikes});
    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      Navigator.pop(context); // It doesn't refresh to reflect new edit
      // Navigator.pushNamed(context, '/profile', arguments: email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter your name",
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Age",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
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
            SizedBox(height: 20.0),
            Text(
              "Location",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: locationController,
              decoration: InputDecoration(
                hintText: "Enter your location",
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Likes",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: likesController,
              decoration: InputDecoration(
                hintText: "Enter your likes",
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Dislikes",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: dislikesController,
              decoration: InputDecoration(
                hintText: "Enter your dislikes",
              ),
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: saveProfile,
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}