import 'package:flutter/material.dart';
import 'package:acrilc/constants/themes.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        // Add padding to the left and right
        children: [
          
          Expanded(
            child: TextField(
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: 'Search art, artists, collections',
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Color.fromARGB(198, 35, 10, 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
