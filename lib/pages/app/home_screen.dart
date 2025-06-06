import 'package:acrilc/widgets/customer_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
  final List<String> gridimages = [
    'https://picsum.photos/id/238/600/600',
    'https://picsum.photos/id/239/200/400',
    'https://picsum.photos/id/240/700/500',
    'https://picsum.photos/id/241/200/600',
    'https://picsum.photos/id/239/200/400',
    'https://picsum.photos/id/239/200/400',
    'https://picsum.photos/id/240/700/500',
    'https://picsum.photos/id/239/200/400',
    'https://picsum.photos/id/240/700/500',
    'https://picsum.photos/id/241/200/600',
    'https://picsum.photos/id/239/200/400',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(11.0),
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
                tabs: [
                  _buildEqualWidthTab("For You"),
                  _buildEqualWidthTab("Craft"),
                  _buildEqualWidthTab("Mood Board"),
                  _buildEqualWidthTab("Painting"),
                  _buildEqualWidthTab("Photography"),
                  _buildEqualWidthTab("Sculpture"),
                  _buildEqualWidthTab("Digital Art"),
                  _buildEqualWidthTab("Others"),
                ],
              ),
              const SizedBox(height: 16),
        
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
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
                                    return _buildCar();
                                  },
                                ),
                              ),
                              const SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(
                                            0xFFE34A1C,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {}, // Empty function
                                        child: Text('Read More'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
        
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  boardName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              // GridView for images
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: MasonryGridView.count(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  itemCount: gridimages.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(gridimages[index]),
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

Widget _buildEqualWidthTab(String label) {
  return Tab(child: SizedBox(width: 70, child: Center(child: Text(label))));
}

Widget _buildCar() {
  return SizedBox(
    width: 200,
    height: 164,
    child: Stack(
      children: <Widget>[
        Card(
          color: Colors.brown,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                width: 235,
                height: 140,
                child: Image.network(
                  'https://placebeard.it/640/480g',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 5,
          left: 10,
          right: 10,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Title',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle order click
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      textStyle: const TextStyle(fontSize: 12),
                      minimumSize: const Size(0, 30),
                    ),
                    child: const Text('Order Now'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
