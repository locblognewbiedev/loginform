import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Danh sách động cho ListView.builder
  final List<int> dynamicList = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    String username = widget.username;
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Home Screen!\nUsername: $username',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 3);
                },
                child: Text('quay lại login')),
            const SizedBox(height: 16),

            // ListView động
            const Text('ListView động:'),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: dynamicList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item ${dynamicList[index]}'),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text('ListView tĩnh:'),
            SizedBox(
              height: 100,
              child: ListView(
                children: const [
                  ListTile(
                    title: Text('Static Item 1'),
                  ),
                  ListTile(
                    title: Text('Static Item 2'),
                  ),
                  ListTile(
                    title: Text('Static Item 3'),
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
