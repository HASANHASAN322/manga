import 'package:flutter/material.dart';



class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({super.key, required this.body});

  final List<Widget> body ;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: body
        ),
      );
  }
}