import 'package:flutter/material.dart';
import 'package:manga/utils/constants/size.dart';



class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image) , fit: BoxFit.fill)
      ),
      child: Padding(
        padding: const EdgeInsets.all(MySize.myPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontSize: 24 , color: Colors.white , fontWeight: FontWeight.bold ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              subTitle,
              style: const TextStyle(fontSize: 16 , color: Colors.white  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}