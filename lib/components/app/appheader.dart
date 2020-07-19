import 'package:flutter/material.dart';

class AppHeader extends StatefulWidget implements PreferredSizeWidget {
  AppHeader({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _AppHeaderState createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      iconTheme: IconThemeData(color: Colors.grey.shade800),
      actionsIconTheme: IconThemeData(color: Colors.grey.shade800),
      leading: Builder(
        builder: (context) => IconButton(
          icon: new Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      // On Android by default its false
      title: Text("FPA - Flutter Project Accelerator", style: TextStyle(color: Colors.grey.shade800)),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.grey.shade800,
            size: 26.0,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.grey.shade800,
            size: 26.0,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
