import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/theme.dart';
import 'package:flutter_project_accelerator/uilayout.dart';

class SearchForm extends StatefulWidget {
  SearchForm({
    Key key,
    this.searchTerm,
    this.onSearchTermUpdate,
  }) : super(key: key);

  final String searchTerm;
  final Function onSearchTermUpdate;

  @override
  SearchFormState createState() => SearchFormState();
}

class SearchFormState extends State<SearchForm> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double defaultSize = UILayout.defaultSize;
    return Container(
      height: 80,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
              child: TextField(
                  controller: _controller..text = this.widget.searchTerm,
                  decoration: InputDecoration(hintText: 'Enter a search term'),
                  onSubmitted: (String value) async {
                    this.widget.onSearchTermUpdate(value);
                  })),
          SizedBox(
              width: 50,
              child: IconButton(
                icon: Icon(Icons.search, size: defaultSize * 3),
                onPressed: () {
                  this.widget.onSearchTermUpdate(_controller.text);
                },
              ))
        ],
      ),
    );
  }
}
