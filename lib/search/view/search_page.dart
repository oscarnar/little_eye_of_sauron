import 'package:flutter/material.dart';
import 'package:little_eye_of_sauron/search/widgets/search_widget.dart';
import 'package:little_eye_of_sauron/ui_utils/colors.dart';
import 'package:little_eye_of_sauron/ui_utils/constans/assets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColors.purple,
      appBar: AppBar(
        leadingWidth: 120,
        leading: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Image(
            image: AssetImage(Assets.logo),
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
          width: 800,
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.5,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Little Eye of Sauron',
                  style: Theme.of(context).textTheme.headline1!.apply(
                        color: PColors.white,
                        fontSizeDelta: 2,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Text(
                  'There are eyes in many places, but we have one in your pocket.',
                  style: Theme.of(context).textTheme.subtitle1!.apply(
                        color: PColors.white,
                        fontWeightDelta: 1,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                SearchWidget()
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 55,
        color: const Color(0xFF1D1A3F),
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 180,
            ),
            child: Text(
              'Copyright 2021 Little Eye of Sauron. All rights are reserved.',
              style: Theme.of(context).textTheme.subtitle1!.apply(
                    color: PColors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
