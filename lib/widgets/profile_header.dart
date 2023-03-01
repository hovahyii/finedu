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
                  'https://th.bing.com/th/id/R.d7b04b04eda8f617f16de358ecf73e1d?rik=iMPe7Tum3ARuOw&riu=http%3a%2f%2fwww.brooklynvegan.com%2ffiles%2f2017%2f07%2fjohn-doe.jpg%3fw%3d630%26h%3d630%26zc%3d1%26s%3d0%26a%3dt%26q%3d89&ehk=pXpItPkUCgUQ3KyCY%2fthlMMbBiai7G3qqm%2blc2VBjmE%3d&risl=&pid=ImgRaw&r=0',
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
