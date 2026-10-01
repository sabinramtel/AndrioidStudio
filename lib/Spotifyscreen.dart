import 'package:flutter/material.dart';

class SpotifyScreen extends StatefulWidget {
  const SpotifyScreen({super.key});

  @override
  State<SpotifyScreen> createState() => _SpotifyScreenState();
}

class _SpotifyScreenState extends State<SpotifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text(
          "Recently played",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.history, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.settings_outlined, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recently Played Section (Circular Artists)
            Row(
              children: [
                _buildArtistItem("Lana Del Rey", "assets/images/lana_del_rey.png"),
                const SizedBox(width: 20),
                _buildArtistItem("Marvin Gaye", "assets/images/marvin_gaye.png"),
              ],
            ),
            const SizedBox(height: 30),

            // Spotify Wrapped Section Header
            const Text(
              "#SPOTIFYWRAPPED",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Your 2021 in review",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // 2021 Wrapped Grid Items
            Row(
              children: [
                Expanded(
                  child: _buildGridItem(
                    title: "Your Top Songs 2021",
                    imagePath: "assets/images/top_songs_2021.png",
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildGridItem(
                    title: "Your Artists Revealed",
                    imagePath: "assets/images/artists_revealed.png",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Editor's Picks Section Header
            const Text(
              "Editor's picks",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Editor's Picks Grid Items
            Row(
              children: [
                Expanded(
                  child: _buildGridItem(
                    title: "Ed Sheeran, Big Sean, Juice WRLD, Post Malone",
                    imagePath: "assets/images/editors_pick_1.png",
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildGridItem(
                    title: "Mitski, Tame Impala, Glass Animals, Charli XCX",
                    imagePath: "assets/images/editors_pick_2.png",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Circular Artist Items
  Widget _buildArtistItem(String name, String imagePath) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 100,
              width: 100,
              color: Colors.grey[800],
              child: const Icon(Icons.person, color: Colors.white, size: 50),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  // Helper Widget for Square Cards
  Widget _buildGridItem({required String title, required String imagePath}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey[800],
              child: const Icon(Icons.music_note, color: Colors.white, size: 40),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}