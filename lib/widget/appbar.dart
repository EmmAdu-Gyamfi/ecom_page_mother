import 'package:flutter/material.dart';
import 'package:page/global/typedef.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leadingIcon;
  final List<IconData>? actionIcons;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? iconColor;

  const AppBarCustom({
    Key? key,
    required this.title,
    required this.leadingIcon,
    this.actionIcons,
    this.backgroundColor,
    this.titleColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
      leading: Icon(leadingIcon, color: iconColor ?? Theme.of(context).iconTheme.color),
      title: Text(
        title,
        style: TextStyle(color: titleColor ?? Theme.of(context).appBarTheme.titleTextStyle?.color),
      ),
      actions: actionIcons != null
          ? actionIcons!.map((iconData) => Padding(
        padding: const EdgeInsets.only(right: Types.paddingSmall),
        child: Icon(iconData, color: iconColor ?? Theme.of(context).iconTheme.color),
      )).toList()
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(Types.double60);
}
