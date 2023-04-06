import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draggable Sheet Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ModalSheet(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ModalSheet extends StatefulWidget {
  const ModalSheet({super.key});

  @override
  _ModalSheetState createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        children: <Widget>[
          // Add your main content here
          const Center(
            child: Text("Main Content"),
          ),
          // Add the DraggableScrollableSheet widget here
          DraggableScrollableSheet(
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                color: Colors.white,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("Item $index"),
                    );
                  },
                ),
              );
            },
            initialChildSize: 0.3,
            minChildSize: 0.1,
            maxChildSize: 1,
            snapSizes: const [0.1, 0.3, 0.6, 0.9, 1],
            snap: true,
          ),
        ],
      ),
    );
  }
}

