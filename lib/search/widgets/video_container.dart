import 'package:flutter/material.dart';
import 'package:little_eye_of_sauron/ui_utils/colors.dart';

class VideoContainer extends StatelessWidget {
  const VideoContainer({
    Key? key,
    required this.img,
    required this.title,
  }) : super(key: key);
  final String? title;
  final String? img;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 7,
            offset: Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 250,
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(img!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 400,
            decoration: const BoxDecoration(
              color: Colors.black87,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title!,
                style: Theme.of(context).textTheme.subtitle1!.apply(
                      color: PColors.white,
                      fontWeightDelta: 1,
                    ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
