import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/theme.dart';
import 'package:flutter_project_accelerator/uilayout.dart';

class IconListItem extends StatelessWidget {
  const IconListItem({
    Key key,
    this.icon,
    this.title,
    this.onTap,
  }) : super(key: key);
  final Icon icon;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    double defaultSize = UILayout.defaultSize;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultSize * 2, vertical: defaultSize * 3),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              Icon(icon.icon),
              SizedBox(width: defaultSize * 2),
              Text(
                title,
                style: TextStyle(
                  fontSize: defaultSize * 1.6, //16
                  color: kTextLightColor,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: defaultSize * 1.6,
                color: kTextLightColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
