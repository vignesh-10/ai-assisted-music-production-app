import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI-Assisted Music Production',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LyricsPage(),
    );
  }
}

class LyricsPage extends StatefulWidget {
  @override
  _LyricsPageState createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {
  TextEditingController _languageController = TextEditingController();
  TextEditingController _genreController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String _generatedLyrics = '';

  Future<void> generateLyrics() async {
    final url = Uri.parse('http://localhost:5000/generate_lyrics');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'description': _descriptionController.text}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _generatedLyrics = data['lyrics'];
      });
    } else {
      setState(() {
        _generatedLyrics = 'Error generating lyrics: ${response.body}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI-Assisted Music Production'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _languageController,
              decoration: InputDecoration(labelText: 'Language'),
            ),
            TextField(
              controller: _genreController,
              decoration: InputDecoration(labelText: 'Genre'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Describe the song'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateLyrics,
              child: Text('Create/Update Lyrics'),
            ),
            SizedBox(height: 20),
            Text(
              _generatedLyrics,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
