import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper'),
        centerTitle: true,
      ),
      body: Container(
        decoration: buildGradient(),
        child: ListView(
          children: <Widget>[
            buildProfileCard(),
            buildFriendsRatingToday(),
            buildActivityChart(),
            buildAchievements(),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildGradient() => BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey[300], Colors.white]));

  Widget buildProfileCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 50,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('Artem Cherkashin'),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                  child: Text('200000'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: Text('200000'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildFriendsRatingToday() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        child: Card(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              buildItemFriend('Olya Selivanova', '22091'),
              buildItemFriend('Gena Bukin', '12309'),
              buildItemFriend('Vasya', '11231'),
              buildItemFriend('Kolya228', '2456'),
              buildItemFriend('Putin', '1000'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemFriend(String name, String steps) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black,
          ),
          Text(name),
          Text(steps),
        ],
      ),
    );
  }

    Widget buildActivityChart() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Text('Activity Chart'),
        ),
      );
    }

  Widget buildAchievements() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Text('Achievements'),
      ),
    );
  }
}
