import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map movie;

  DetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        backgroundColor: Colors.black, // Set app bar background to black
        iconTheme:
            IconThemeData(color: Colors.white), // Set back icon color to white
        title: Text(
          movie['name'],
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie['image'] != null)
              Image.network(movie['image']['original']),
            SizedBox(height: 16),
            Text(
              movie['name'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Set title text color to white
              ),
            ),
            SizedBox(height: 16),
            Text(
              movie['summary'] ?? 'No summary available.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white, // Set summary text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
