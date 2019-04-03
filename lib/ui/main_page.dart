import 'package:flutter/material.dart';
import 'package:stepper/ui/user/user_page.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: draw(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          buildBottomNavigationBarItem(
              "assets/foots.png", "assets/foots_outline.png", 'Steps'),
          buildBottomNavigationBarItem(
              "assets/friends_colored.png", "assets/friends.png", 'Friends'),
          buildBottomNavigationBarItem("assets/achievements_colored.png",
              "assets/achievements.png", 'Tasks'),
        ],
        currentIndex: _currentIndex,
        onTap: onTapped,
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
          String solidIcon, String outlineIcon, String name) =>
      BottomNavigationBarItem(
        activeIcon: Image(
          image: AssetImage(solidIcon),
          width: 24,
          height: 24,
        ),
        icon: Image(
          image: AssetImage(outlineIcon),
          width: 24,
          height: 24,
        ),
        title: Text(name),
      );

  onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget draw(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return UserPage();
      case 1:
        return DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: TabBar(
                  labelColor: Colors.black,
                  tabs: [
                    Tab(text: "Friends"),
                    Tab(text: "Requests"),
                    Tab(text: "Search"),
                  ],
                ),
                body: TabBarView(
                  children: <Widget>[
                    ListView(
                      children: <Widget>[
                        Card(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage("assets/avatar.jpg"),
                                ),
                                padding: EdgeInsets.all(16),
                              ),
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text("Artem Cherkshin"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text("22 000"),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      color: Colors.blue,
                    ),
                    Container(
                      color: Colors.green,
                    ),
                  ],
                )));
      case 2:
        return Scaffold(
            body: ListView(
          children: <Widget>[
            Card(
              child: Row(
                children: <Widget>[
                  Padding(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/avatar.jpg"),
                    ),
                    padding: EdgeInsets.all(16),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("Artem Cherkshin"),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("22 000"),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
    }
  }
}
