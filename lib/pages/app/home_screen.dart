import 'package:acrilc/widgets/customer_search.dart';
import 'package:flutter/material.dart';
import 'package:acrilc/constants/colors.dart';
import 'package:acrilc/constants/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomSearchBar(),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(width: 160, color: Colors.red),
                Container(width: 160, color: Colors.blue),
                Container(width: 160, color: Colors.green),
                Container(width: 160, color: Colors.yellow),
                Container(width: 160, color: Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
