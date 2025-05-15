import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 90, 48), // Dark brown-ish background
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        // Add padding to the left and right
        children: [
          Icon(Icons.search, color: Colors.brown[100], size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.brown[100], fontSize: 16),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search  art, artists, collections",
                hintStyle: TextStyle(color: Color(0xFFD6C4BE), fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
