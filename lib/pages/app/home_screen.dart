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
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: AppColor.primary,
      ),
      body: Center(
        child: CustomSearchBar(),
      ),
    );
  }
}
