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
          SizedBox(
            height: 40,
            child: Expanded(
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildFilterChip(showArrow: true, "For You", Theme.of(context)),
                  const SizedBox(width: 8),
                  _buildFilterChip("Craft", Theme.of(context)),
                  const SizedBox(width: 8),
                  _buildFilterChip("Mood Board", Theme.of(context)),
                  const SizedBox(width: 8),
                  _buildFilterChip("Painting", Theme.of(context)),
                  const SizedBox(width: 8),
                  _buildFilterChip("Photography", Theme.of(context)),
                  const SizedBox(width: 8),
                  _buildFilterChip("Sculpture", Theme.of(context)),
                  const SizedBox(width: 8),
                  _buildFilterChip("Digital Art", Theme.of(context)),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildFilterChip(
  String label,
  ThemeData theme, {
  bool showArrow = false,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: theme.cardColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: theme.textTheme.bodyMedium),
        if (showArrow) ...[
          const SizedBox(width: 4),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 18,
            color: Colors.grey,
          ),
        ],
      ],
    ),
  );
}
