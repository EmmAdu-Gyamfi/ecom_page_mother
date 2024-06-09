import 'package:flutter/material.dart';
import 'package:page/global/typedef.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leadingIcon;
  final List<IconData>? actionIcons;

  const AppBarCustom({
    Key? key,
    required this.title,
    required this.leadingIcon,
    this.actionIcons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(leadingIcon),
      title: Text(title),
      actions: actionIcons != null
          ? actionIcons!.map((iconData) => Padding(
        padding: const EdgeInsets.only(right: Types.paddingSmall),
        child: Icon(iconData),
      )).toList()
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
