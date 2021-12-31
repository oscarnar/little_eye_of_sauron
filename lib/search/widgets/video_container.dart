import 'package:flutter/material.dart';
import 'package:little_eye_of_sauron/ui_utils/colors.dart';

class VideoContainer extends StatelessWidget {
  const VideoContainer({
    Key? key,
    required this.img,
    required this.title,
    required this.labels,
  }) : super(key: key);
  final String? title;
  final String? img;
  final String? labels;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 7,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(img!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              width: 400,
              decoration: const BoxDecoration(
                color: Colors.black87,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      title!,
                      style: Theme.of(context).textTheme.subtitle1!.apply(
                            color: PColors.white,
                            fontWeightDelta: 1,
                          ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Labels: ${labels!}',
                      style: Theme.of(context).textTheme.bodyText2!.apply(
                            color: PColors.white,
                            fontSizeDelta: -1,
                          ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
