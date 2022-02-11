import 'package:flutter/material.dart';
import 'package:flutter_app/core/components/bottom_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Home Page"),
      ),
      bottomNavigationBar: CustomBottomBar(index: 0),
    );
  }
}