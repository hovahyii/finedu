import 'package:flutter/material.dart';
import 'custom_card.dart';
import '../models/podcast.dart';

class PodcastCard extends StatelessWidget {
  final Podcast podcast;

  PodcastCard({required this.podcast});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: CustomCard(
                borderRadius: BorderRadius.zero,

        borderSide: BorderSide.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 120,
              child: Image.network(
                podcast.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              podcast.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              podcast.author,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
