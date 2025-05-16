import 'package:flutter/material.dart';
import 'package:acrilc/widgets/customer_search.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, List<String>> boardImages = {
    'Modern Indian Painting': List.generate(
      5,
      (_) => 'https://placebeard.it/640/480g',
    ),
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSearchBar(),
            ),
            const SizedBox(height: 20),
            ButtonsTabBar(

              backgroundColor: Colors.red,
              unselectedBackgroundColor: Colors.grey[300],
              unselectedLabelStyle: const TextStyle(color: Colors.black),
              labelStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              borderColor: Colors.red,
              unselectedBorderColor: const Color.fromARGB(255, 251, 250, 250),
             
              tabs: const [
                Tab(text: "For You",),
                Tab(text: "Craft"),
                Tab(text: "Mood Board"),
                Tab(text: "Painting"),
                Tab(text: "Photography"),
                Tab(text: "Sculpture"),
                Tab(text: "Digital Art"),
                Tab(text: "Others"),
              ],
            ),
            const SizedBox(height: 16),
          
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildJoinedInviteRow(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                children: List.generate(6, (index) {
                  if (index == 0) {
                    // Main tab content
                    return ListView.builder(
                      itemCount: boardImages.length,
                      itemBuilder: (context, boardIndex) {
                        String boardName = boardImages.keys.elementAt(
                          boardIndex,
                        );
                        List<String> images = boardImages[boardName]!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: images.length,
                                itemBuilder: (context, imageIndex) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          child: Image.network(
                                            images[imageIndex],
                                            width: 170,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const Text('IMAGE'),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (index == 1) {
                      return const Center(child: Text("Craft"));
                    } else if (index == 2) {
                      return const Center(child: Text("Mood Board"));
                    } else if (index == 3) {
                      return const Center(child: Text("Painting"));
                    } else if (index == 4) {
                      return const Center(child: Text("Photography"));
                    } else if (index == 5) {
                      return const Center(child: Text("Sculpture"));
                    } else if (index == 6) {
                      return const Center(child: Text("Digital Art"));
                    } else {
                      return const Center(child: Text("Others"));
                    }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
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


