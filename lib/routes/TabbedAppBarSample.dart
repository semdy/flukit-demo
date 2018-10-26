import 'package:flutter/material.dart';

class TabbedAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: tabChoices.length,
      child: new Scaffold(
        appBar: new AppBar(
          title: const Text('Tabbed AppBar'),
          bottom: new TabBar(
            isScrollable: true,
            tabs: tabChoices.map((TabChoice choice) {
              return new Tab(
                text: choice.title,
                icon: new Icon(choice.icon),
              );
            }).toList(),
          ),
        ),
        body: new TabBarView(
          children: tabChoices.map((TabChoice choice) {
            return new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new TabChoiceCard(choice: choice),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class TabChoice {
  const TabChoice({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<TabChoice> tabChoices = const <TabChoice>[
  const TabChoice(title: 'CAR', icon: Icons.directions_car),
  const TabChoice(title: 'BICYCLE', icon: Icons.directions_bike),
  const TabChoice(title: 'BOAT', icon: Icons.directions_boat),
  const TabChoice(title: 'BUS', icon: Icons.directions_bus),
  const TabChoice(title: 'TRAIN', icon: Icons.directions_railway),
  const TabChoice(title: 'WALK', icon: Icons.directions_walk),
];

class TabChoiceCard extends StatelessWidget {
  const TabChoiceCard({ Key key, this.choice }) : super(key: key);

  final TabChoice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}