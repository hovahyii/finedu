import 'package:flutter/material.dart';
import 'package:finedu/widgets/circle_banner.dart';
import 'package:finedu/widgets/level_bar.dart';

class ProfileHeader extends StatelessWidget {
  final String userName;
  final int userLevel;

  ProfileHeader({
    required this.userName,
    required this.userLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleBanner(
              imageUrl:
                  'https://iemumpss.vercel.app/assets/img/developer/hovah.jpeg',
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: LevelBar(
                      level: userLevel,
                      levelText: 'Beginner',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
