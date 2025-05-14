import 'package:acrilc/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:acrilc/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppThemes.lightTheme;

    return Theme(
      data: theme,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor ?? Colors.white,
        body: _isLoading ? _buildShimmer(theme) : _buildContent(theme),
      ),
    );
  }

  Widget _buildShimmer(ThemeData theme) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: List.generate(10, (index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 100,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildContent(ThemeData theme) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        // Search Bar
        TextField(
          style: theme.textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: 'Search art, artists, collections',
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.black38,
            ),
            prefixIcon: const Icon(Icons.search, color: Colors.black45),
            filled: true,
            fillColor: theme.cardColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Filter Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildFilterChip('For You', theme, showArrow: true),
              const SizedBox(width: 8),
              _buildFilterChip('Craft', theme, showArrow: true),
              const SizedBox(width: 8),
              _buildFilterChip('Mood Board', theme),
              const SizedBox(width: 8),
              _buildFilterChip('Painting', theme),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // New Joined Row
        _buildJoinedInviteRow(),

        const SizedBox(height: 12),

        // Art Cards
        // Art Cards
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildHorizontalArtCard('Abstract Art\nby Avantika Singh', theme, 1),
              const SizedBox(width: 8),
              _buildHorizontalArtCard('Abstract Art\nby Joydeep Das', theme,2),
            ],
          ),
        ),

        const SizedBox(height: 12),

        Center(
          child: TextButton(
            onPressed: () {},
            child: Text('Read more', style: theme.textTheme.bodyMedium),
          ),
        ),
        const SizedBox(height: 12),

        Text('Relevant Posts', style: theme.textTheme.headlineMedium),
        const SizedBox(height: 8),
        buildPostsGrid(theme),

        const SizedBox(height: 12),
        Text(
          'More Posts from the world',
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        _buildBottomPosts(),
      ],
    );
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

  Widget _buildHorizontalArtCard(String title, ThemeData theme, dynamic index) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://picsum.photos/seed/${index + 1}/150/100',
              height: 100,
              width: 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Order Now"),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.primaryColor,
              minimumSize: const Size(100, 35),
            ),
          ),
        ],
      ),
    );
  }

//   Widget _buildHorizontalArtCard(String title, ThemeData theme, dynamic index) {
//   return SizedBox(
//     height: 200, // Set the height for horizontal scrolling
//     child: ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: 50, // Number of images
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 5),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Image.network(
//               'https://picsum.photos/seed/$index/200/200',
//               width: 150,
//               height: 150,
//               fit: BoxFit.cover,
//               loadingBuilder: (context, child, progress) {
//                 if (progress == null) return child;
//                 return const Center(child: CircularProgressIndicator());
//               },
//               errorBuilder: (context, error, stackTrace) =>
//                   const Icon(Icons.error),
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }


 Widget buildPostsGrid(ThemeData theme) {
  return GridView.builder(
    padding: const EdgeInsets.all(10),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3, // 3 items per row
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    itemCount: 30, // You can change this number
    itemBuilder: (context, index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://picsum.photos/seed/$index/200/200',
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        ),
      );
    },
  );
}


  Widget _buildBottomPosts() {
    final images = List.generate(
      3,
      (index) => 'https://via.placeholder.com/100x120?text=World+${index + 1}',
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          images
              .map(
                (img) => ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    img,
                    width: 100,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              .toList(),
    );
  }
}
