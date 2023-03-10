import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Function onTap;

  const CustomCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        margin: const EdgeInsets.only(bottom: 7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        color: backgroundColor,
        child: ListTile(
          title: Text(title),
          leading: Icon(
            icon,
            color: iconColor,
          ),
          trailing: const Icon(Icons.navigate_next),
        ),
      ),
    );
  }
}
