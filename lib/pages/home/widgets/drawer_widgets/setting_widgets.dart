


import 'package:flutter/material.dart';

import '../../../../utils/constants/size.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({
    super.key, required this.onTap, required this.icon, required this.title,
  });

  final void Function() onTap ;
  final IconData icon ;
  final String title ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: MySize.myPadding ),
        padding: const EdgeInsets.symmetric(horizontal: MySize.myPadding ),
        child: Row(
          children: [
            Icon(icon , color: Colors.white,size: 22,) ,
            const SizedBox(width: MySize.spaceBetweenItems,) ,
            Text(title , style: const TextStyle(color: Colors.white , fontSize: 20))
          ],
        ),
      ),
    );
  }
}