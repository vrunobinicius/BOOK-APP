import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const TextField(),
            const SizedBox(height: 16),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.search),
                label: const Text("Pesquisar")),
            const SizedBox(height: 16),
            Text(
              "Foram encontrados X livros sobre X:",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
