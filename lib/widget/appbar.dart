import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leadingIcon;
  final List<IconData> actionIcons;

  const AppBarCustom({super.key,
    required this.title,
    required this.leadingIcon,
    required this.actionIcons,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(leadingIcon),
      title: Text(title),
      actions: actionIcons.map((iconData) => Padding(padding: const EdgeInsets.only(right: 5), child: Icon(iconData))).toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
