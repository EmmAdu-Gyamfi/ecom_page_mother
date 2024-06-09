import 'package:flutter/material.dart';

import '../global/typedef.dart';
import '../widget/appbar.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: Types.managePage, leadingIcon: Icons.list,),
    );
  }
}
