import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category Screen"),
      ),
      body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3/2, // width : height


          ),
        children: [
          Container( color: Colors.red, ),
          Container( color: Colors.yellow, ),
          Container( color: Colors.purple, ),
          Container( color: Colors.blue, ),
        ],
      ),
    );
  }
}
