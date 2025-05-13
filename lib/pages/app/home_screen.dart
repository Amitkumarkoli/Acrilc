import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search art, artists, collections",
                hintStyle: textTheme.bodyMedium,
                filled: true,
                fillColor: Theme.of(context).cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Filters
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterChip(
                  label: Row(
                    children: [
                      Text("All Types", style: textTheme.bodyMedium),
                      const Icon(Icons.arrow_drop_down, size: 12),
                    ],
                  ),
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: Row(
                    children: [
                      Text("All Styles", style: textTheme.bodyMedium),
                      const Icon(Icons.arrow_drop_down, size: 12),
                    ],
                  ),
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: Row(
                    children: [Text("Mood Board", style: textTheme.bodyMedium)],
                  ),
                  onSelected: (_) {},
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Profile Avatars Row
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder:
                    (_, i) => CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=$i',
                      ),
                      radius: 24,
                    ),
              ),
            ),
            const SizedBox(height: 16),

            // Artwork cards
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  _buildArtworkCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1597434575180-3b807c0e6ba9',
                    title: 'Abstract Art',
                    artist: 'By Mandy',
                    context: context,
                  ),
                  const SizedBox(width: 12),
                  _buildArtworkCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1597434575180-3b807c0e6ba9',
                    title: 'Abstract Art',
                    artist: 'By John',
                    context: context,
                  ),
                  const SizedBox(width: 12),
                  _buildArtworkCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1545235617-9465d2a556c1',
                    title: 'Abstract Art',
                    artist: 'By Mandy',
                    context: context,
                  ),
                  const SizedBox(width: 12),
                  _buildArtworkCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1572786413899-e6c99d41b5ae',
                    title: 'Abstract Art',
                    artist: 'By John',
                    context: context,
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Relevant Post
            Text("Relevant Posts", style: textTheme.headlineMedium),
            const SizedBox(height: 12),

            // Post 1
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/44.jpg',
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Lidia Roberts", style: textTheme.headlineSmall),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.more_horiz,
                          size: 18,
                          color: Colors.grey,
                        ), // 3-dot icon beside the name
                      ],
                    ),
                    Text("1d", style: textTheme.titleMedium),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 8),
            Text(
              "Just listed a few new pieces on my website, check them out!",
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Image.network(
                    'https://picsum.photos/id/1013/300/150',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    children: [
                      Image.network('https://picsum.photos/id/1014/150/80'),
                      const SizedBox(height: 4),
                      Image.network('https://picsum.photos/id/1015/150/80'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(label: Text("Applause", style: textTheme.bodyMedium)),
                Chip(label: Text("Comment", style: textTheme.bodyMedium)),
                Chip(label: Text("Appreciate", style: textTheme.bodyMedium)),
              ],
            ),
            const SizedBox(height: 24),

            // Post 2
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/women/44.jpg',
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Owen Chu", style: textTheme.headlineSmall),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.more_horiz,
                          size: 18,
                          color: Colors.grey,
                        ), // 3-dot icon beside the name
                      ],
                    ),
                    Text("1d", style: textTheme.titleMedium),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text("Having the best time in Vegas", style: textTheme.bodyMedium),
            const SizedBox(height: 8),
            Image.network('https://picsum.photos/id/1016/300/200'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(label: Text("Applause", style: textTheme.bodyMedium)),
                Chip(label: Text("Comment", style: textTheme.bodyMedium)),
                Chip(label: Text("Appreciate", style: textTheme.bodyMedium)),
              ],
            ),
            const SizedBox(height: 24),

            // New Arrivals Section
            Text("New Arrivals", style: textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(
              "Explore a collection of new arrivals that are the perfect blend of modern and classic design.",
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Explore New Arrivals"),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Image.network('https://picsum.photos/id/1019/150/150'),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Image.network('https://picsum.photos/id/1020/150/150'),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildArtworkCard({
    required String imageUrl,
    required String title,
    required String artist,
    required BuildContext context,
  }) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20), // More rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
              height: 180,
              width: 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(artist, style: Theme.of(context).textTheme.titleMedium),
          ),
        ],
      ),
    );
  }
}
