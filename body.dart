import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'ListView Example';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final items = List.generate(2000, (counter) => 'Item: $counter');

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: buildListViews(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              icon: Text('ListView'),
              title: Text('Vertical'),
            ),
          ],
          onTap: (int index) => setState(() => this.index = index),
        ),
      );

  Widget buildListViews() {
    if (index == 1) {
      return buildVerticalListView();
    } else {
      return Container();
    }
  }

  Widget buildBasicListView() => ListView(
        children: [
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text('Favourites'),
            subtitle: Text('All your favourite widgets'),
            trailing: Icon(Icons.star, color: Colors.orange),
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text(''),
            trailing: Icon(Icons.mood, color: Colors.blue),
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text(''),
            trailing: Icon(Icons.assistant_photo, color: Colors.black),
          ),
          ListTile(
            leading: Icon(Icons.delete_forever, color: Colors.red),
            title: Text(''),
          ),
        ],
      );

  Widget buildVerticalListView() => ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Colors.black),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return ListTile(
            title: Text(item),
          );
        },
      );
}
