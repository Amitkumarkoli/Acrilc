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
  
  final Map<String, List<String>> boardImages = {
    'Modern Indian Painting': [
      'https://placebeard.it/640/480g',
      'https://placebeard.it/640/480g',
      'https://placebeard.it/640/480g',
      'https://placebeard.it/640/480g',
      'https://placebeard.it/640/480g',
    ],
  };

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
          
          const SizedBox(height: 20),
         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildJoinedInviteRow(),
          ),
          const SizedBox(height: 20),
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
Widget _buildJoinedInviteRow() {
  const int avatarCount = 6;
  const double avatarRadius = 20;
  const double overlapOffset = 20;
  final double totalWidth =
      (avatarCount - 1) * overlapOffset + (avatarRadius * 2);

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Avatars
      SizedBox(
        height: avatarRadius * 2,
        width: totalWidth,
        child: Stack(
          clipBehavior: Clip.none,
          children: List.generate(avatarCount, (index) {
            return Positioned(
              left: index * overlapOffset,
              child: CircleAvatar(
                radius: avatarRadius,
                backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/${index + 10}.jpg',
                ),
              ),
            );
          }),
        ),
      ),

      const SizedBox(width: 12),

      // Right Column: "joined" + social icons in one row, and "Invite your friends" below
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row for "joined" and icons
            Row(
              children: [
                const Text(
                  "joined",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(width: 8),
                Image.network(
                  'https://cdn-icons-png.flaticon.com/24/145/145802.png',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Image.network(
                  'https://cdn-icons-png.flaticon.com/24/145/145812.png',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Image.network(
                  'https://cdn-icons-png.flaticon.com/24/145/145807.png',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              "Invite your friends",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
