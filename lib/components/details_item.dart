import 'package:flutter/material.dart';

class DetailsItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  DetailsItem(this.icon, this.title, this.subtitle);

  @override
  _DetailsItemState createState() => _DetailsItemState();
}

class _DetailsItemState extends State<DetailsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListTile(
        dense: true,
        leading: Icon(widget.icon, color: Colors.redAccent),
        title: Text(
          widget.title,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        trailing: Text(
          widget.subtitle != null ? widget.subtitle : 'No ' + widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
