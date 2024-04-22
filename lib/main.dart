import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main(List<String> args) {
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.amber,
            backgroundColor: Colors.white,
          ),
          inputDecorationTheme: const InputDecorationTheme()),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  int itemCount = 0;
  String title = "X";

  void _buscarLivros() async {
    title = _controller.text;
    final url = Uri.https(
      'www.googleapis.com',
      '/books/v1/volumes',
      {'q': title},
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      itemCount = jsonResponse['totalItems'];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: _controller,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
                onPressed: () {
                  _buscarLivros();
                },
                icon: const Icon(Icons.search),
                label: const Text("Pesquisar")),
            const SizedBox(height: 16),
            Text(
              "Foram encontrados $itemCount livros sobre $title:",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
