import 'package:flutter/material.dart';

class BottomNavItemWidget extends StatelessWidget {
  final IconData iconData;
  final Function? onTap;
  final bool isSelected;

  const BottomNavItemWidget(
      {super.key, required this.iconData, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        icon: Icon(iconData,
            color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
            size: 25),
        onPressed: onTap as void Function()?,
      ),
    );
  }
}
