import 'package:finedu/screens/analytic_screen.dart';
import 'package:finedu/screens/profile_screen.dart';
import 'package:finedu/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'models/article.dart';
import 'models/podcast.dart';
import 'models/course.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Article> articles = [
      Article(
        title: '5 Tips for Effective Time Management',
        author: 'Jane Smith',
        imageUrl:
            'https://damonza.com/wp-content/uploads/2013/01/shadows_ebook.jpg',
      ),
      Article(
        title: 'How to Stay Motivated When You Feel Stuck',
        author: 'John Doe',
        imageUrl:
            'https://damonza.com/wp-content/uploads/2013/01/shadows_ebook.jpg',
      ),
      Article(
        title: 'The Benefits of Meditation for Productivity',
        author: 'Sarah Lee',
        imageUrl:
            'https://damonza.com/wp-content/uploads/2013/01/shadows_ebook.jpg',
      ),
    ];

    List<Podcast> podcasts = [
      Podcast(
          title: 'The Power of Positive Thinking',
          author: 'Mike Johnson',
          audioUrl:
              'https://podcasts.google.com/feed/aHR0cDovL3JhZGljYWxwZXJzb25hbGZpbmFuY2UubGlic3luLmNvbS9yc3M/episode/Y2VkMjkzODItMjIxZC00OTc2LTk4ZWYtN2VhMmVmY2U4MGU2?sa=X&ved=0CAgQuIEEahcKEwiY2YGV3bn9AhUAAAAAHQAAAAAQLA',
          imageUrl:
              'https://damonza.com/wp-content/uploads/2013/01/shadows_ebook.jpg',
          duration: '5 mins'),
      Podcast(
          title: 'How to Build a Successful Business',
          author: 'Susan Lee',
          audioUrl:
              'https://podcasts.google.com/feed/aHR0cDovL3JhZGljYWxwZXJzb25hbGZpbmFuY2UubGlic3luLmNvbS9yc3M/episode/Y2VkMjkzODItMjIxZC00OTc2LTk4ZWYtN2VhMmVmY2U4MGU2?sa=X&ved=0CAgQuIEEahcKEwiY2YGV3bn9AhUAAAAAHQAAAAAQLA',
          imageUrl:
              'https://damonza.com/wp-content/uploads/2013/01/shadows_ebook.jpg',
          duration: '5 mins'),
      Podcast(
          title: 'The Science of Happiness',
          author: 'James Kim',
          audioUrl:
              'https://podcasts.google.com/feed/aHR0cDovL3JhZGljYWxwZXJzb25hbGZpbmFuY2UubGlic3luLmNvbS9yc3M/episode/Y2VkMjkzODItMjIxZC00OTc2LTk4ZWYtN2VhMmVmY2U4MGU2?sa=X&ved=0CAgQuIEEahcKEwiY2YGV3bn9AhUAAAAAHQAAAAAQLA',
          imageUrl:
              'https://damonza.com/wp-content/uploads/2013/01/shadows_ebook.jpg',
          duration: '5 mins'),
    ];

    List<Course> courses = [
      Course(
        title: 'Introduction to Flutter',
        instructor: 'John Doe',
        imageUrl: 'https://picsum.photos/200/300',
        rating: 4.5,
        numOfRatings: 150,
      ),
      Course(
        title: 'Advanced Flutter',
        instructor: 'Jane Smith',
        imageUrl: 'https://picsum.photos/200/300',
        rating: 4.8,
        numOfRatings: 80,
      ),
      Course(
          title: 'Flutter Animations',
          instructor: 'Bob Johnson',
          imageUrl: 'https://picsum.photos/200/300',
          rating: 4.2,
          numOfRatings: 200),
    ];

    final List<Widget> _children = [
      HomeScreen(
        userName: "Jehovah Yii Zui Hon",
        userLevel: 1,
        articles: articles,
        podcasts: podcasts,
        courses: courses,
      ),
      AnalyticScreen(),
      ProfileScreen(),
    ];

    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return MaterialApp(
      title: 'Finedu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment), label: 'Analytic'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
