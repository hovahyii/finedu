import 'package:finedu/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/circle_banner.dart';
import '../widgets/level_bar.dart';
import '../widgets/article_card.dart';
import '../widgets/podcast_card.dart';
import '../widgets/course_card.dart';
import '../models/article.dart';
import '../models/podcast.dart';
import '../models/course.dart';

class HomeScreen extends StatelessWidget {
  final String userName;
  final int userLevel;
  final List<Article> articles;
  final List<Podcast> podcasts;
  final List<Course> courses;

  HomeScreen({
    required this.userName,
    required this.userLevel,
    required this.articles,
    required this.podcasts,
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ProfileHeader(
              userName: userName,
              userLevel: userLevel,
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Articles',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 220.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (Article article in articles)
                          Padding(
                            padding: EdgeInsets.only(left: 16, right: 8),
                            child: ArticleCard(article: article),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Podcasts',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 220.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (Podcast podcast in podcasts)
                          Padding(
                            padding: EdgeInsets.only(left: 16, right: 8),
                            child: PodcastCard(podcast: podcast),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Courses',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                 Padding(
                    padding: EdgeInsets.only(top: 0, bottom: 40),
                    child: SizedBox(
                      height: 220.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (Course course in courses)
                            Padding(
                              padding: EdgeInsets.only(left: 16, right: 8),
                              child: CourseCard(course: course),
                            ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
