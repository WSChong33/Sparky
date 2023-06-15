import 'package:flutter/material.dart';

class Matches extends StatefulWidget {
  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  List<String> matchNames = ['Match 1', 'Match 2', 'Match 3']; // Replace with names queried from the database

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matches'),
      ),
      body: ListView.builder(
        itemCount: matchNames.length,
        itemBuilder: (context, index) {
          String matchName = matchNames[index];
          return ListTile(
            title: Text(matchName),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chat');
              },
              child: Text('Chat'),
            ),
          );
        },
      ),
    );
  }
}
