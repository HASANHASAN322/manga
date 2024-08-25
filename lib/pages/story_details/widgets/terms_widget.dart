import 'package:flutter/material.dart';
import 'package:manga/utils/constants/colors.dart';

import '../../../utils/constants/size.dart';

class TermsWidget extends StatelessWidget {
  const TermsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MySize.screenWidth,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          height: 80,
          margin:
              const EdgeInsets.symmetric(vertical: MySize.spaceBetweenItems),
          width: MySize.screenWidth,
          decoration: BoxDecoration(
            color: MyColors.grayColor.withOpacity(0.1)
          ),
          child: Center(
              child: Text(
                'الفصل $index' ,
                style: const TextStyle(color: Colors.white , fontSize: 18),)),
        ),
      ),
    );
  }
}
