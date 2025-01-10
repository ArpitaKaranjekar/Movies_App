import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'details_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List searchResults = [];
  TextEditingController _searchController = TextEditingController();

  Future<void> searchMovies(String query) async {
    final response = await http
        .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));
    if (response.statusCode == 200) {
      setState(() {
        searchResults = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        backgroundColor: Colors.black, // Set app bar background to black
        iconTheme:
            IconThemeData(color: Colors.white), // Set icons color to white
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Type to search Movies...',
            hintStyle:
                TextStyle(color: Colors.white), // Set hint text color to white
            border: InputBorder.none, // Remove border around the TextField
          ),
          style:
              TextStyle(color: Colors.white), // Set typed text color to white
          onSubmitted: (value) {
            searchMovies(value);
          },
        ),
      ),
      body: searchResults.isEmpty
          ? Center(
              child: Text(
                'Search for movies!',
                style:
                    TextStyle(color: Colors.white), // Set text color to white
              ),
            )
          : ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final movie = searchResults[index]['show'];
                return ListTile(
                  leading: Image.network(
                    movie['image']?['medium'] ??
                        'https://via.placeholder.com/150',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Colors.grey,
                      ); // Fallback if the image URL is invalid
                    },
                  ),
                  title: Text(
                    movie['name'],
                    style: TextStyle(
                        color: Colors.white), // Set title text color to white
                  ),
                  subtitle: Text(
                    movie['summary'] ?? 'No summary available.',
                    style: TextStyle(
                        color:
                            Colors.white), // Set subtitle text color to white
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(movie: movie),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
