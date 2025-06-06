import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teams List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Teams List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _teams = [];
  bool _loading = false;

  // Mock API call: replace with your actual API logic
  Future<List<String>> fetchTeams() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate network delay
    return ['Team Alpha', 'Team Beta', 'Team Gamma', 'Team Delta'];
  }

  void _onFetchTeams() async {
    setState(() {
      _loading = true;
    });
    try {
      final teams = await fetchTeams();
      setState(() {
        _teams = teams;
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _teams.isEmpty
              ? const Center(
                  child: Text('No teams found. Tap the button to fetch teams.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: _teams.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        title: Text(_teams[index]),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _onFetchTeams,
        label: const Text('Fetch Teams'),
        icon: const Icon(Icons.api),
      ),
    );
  }
}
