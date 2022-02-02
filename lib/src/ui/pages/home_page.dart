import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import '../../domain/entities/entities.dart';

// TODO: Refactor this code later
void _onReorder(int oldIndex, int newIndex) {
  // TODO: Implement Reorder function
  newIndex.inj();
}

// Tabs
final injectedTabPage = RM.injectTabPageView(
  length: 3,
  initialIndex: 0,
  curve: Curves.ease,
  duration: Duration(milliseconds: 300),
);

// List of DataIcon to be used in pages an tabs
final icons = [
  Icons.directions_bike,
  Icons.directions_boat,
  Icons.bus_alert,
];
final label = [
  'Out',
  'In',
  'Cook',
];

Widget _bottomNavigationBar() {
  return OnTabPageViewBuilder(
      listenTo: injectedTabPage,
      builder: (index) {
        return BottomNavigationBar(
          backgroundColor: Colors.lightBlueAccent,
          currentIndex: index,
          onTap: (i) => injectedTabPage.index = i,
          selectedItemColor: Colors.amber[800],
          items: icons
              .getRange(0, injectedTabPage.length)
              .map(
                (icon) => BottomNavigationBarItem(
                  icon: Icon(icon),
                  label: 'Label',
                ),
              )
              .toList(),
        );
      });
}

Widget _body() {
  return OnTabPageViewBuilder(
    builder: (_) => PageView.builder(
      controller: injectedTabPage.pageController,
      itemCount: injectedTabPage.length,
      itemBuilder: (_, i) {
        return Icon(
          icons[i],
          size: 50,
        );
      },
    ),
  );
}

// ***************************************************************************
class MealViewCard extends StatelessWidget {
  final int index;
  final Key key;
  final List<String> mealItems;

  MealViewCard(this.mealItems, this.index, this.key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.blue,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.topRight,
              child: Text(
                'Title ${this.mealItems[this.index]}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.right,
                maxLines: 5,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                textAlign: TextAlign.right,
                maxLines: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);
  Recipe? recipe;
  int fakeKey = 1;
  List<String> meals = [
    'Chicken Soup',
    'Beef Stew',
    'Leftover Ham',
    'Frozen Pizza',
    'Take-Out',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OutInCook'),
      ),
      body: _body(),
      /* ReorderableListView(
        header: Text('Planned Meals'),
        children: List.generate(meals.length, (index) {
          return MealViewCard(
            meals,
            index,
            Key('$index'),
          );
        }),
        onReorder: (oldIndex, newIndex) {},
      ), */
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Deals & Messages'),
            ),
            ListTile(
              title: const Text('Pizza Hut: 2 for 1 Pizzas'),

              // TODO: implement tap feature
              onTap: () {},
            ),
            ListTile(
              title: const Text('Sara: Chicken Pot Pie'),

              // TODO: implement tap feature
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () {
          RM.navigate.toNamed('/addedit');
        },
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}
