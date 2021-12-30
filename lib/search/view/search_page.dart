import 'package:flutter/material.dart';
import 'package:little_eye_of_sauron/search/widgets/search_widget.dart';
import 'package:little_eye_of_sauron/search/widgets/video_container.dart';
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
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.5,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Búsqueda de videos',
                  style: Theme.of(context).textTheme.headline1!.apply(
                        color: PColors.white,
                        fontSizeDelta: 2,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Text(
                  'Proyecto final de Cloud Computing.',
                  style: Theme.of(context).textTheme.subtitle1!.apply(
                        color: PColors.white,
                        fontWeightDelta: 1,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                SearchWidget(),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: GridView.custom(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, childAspectRatio: 4 / 3),
                    childrenDelegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: VideoContainer(
                            img:
                                "https://i1.wp.com/codigoespagueti.com/wp-content/uploads/2014/06/GIF.gif?fit=640%2C360&quality=80&ssl=1",
                            title: "Title of the video",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: VideoContainer(
                            img:
                                "https://i1.wp.com/codigoespagueti.com/wp-content/uploads/2014/06/GIF.gif?fit=640%2C360&quality=80&ssl=1",
                            title: "Title of the video",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: VideoContainer(
                            img:
                                "https://i1.wp.com/codigoespagueti.com/wp-content/uploads/2014/06/GIF.gif?fit=640%2C360&quality=80&ssl=1",
                            title: "Title of the video",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: VideoContainer(
                            img:
                                "https://i1.wp.com/codigoespagueti.com/wp-content/uploads/2014/06/GIF.gif?fit=640%2C360&quality=80&ssl=1",
                            title: "Title of the video",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: VideoContainer(
                            img:
                                "https://i1.wp.com/codigoespagueti.com/wp-content/uploads/2014/06/GIF.gif?fit=640%2C360&quality=80&ssl=1",
                            title: "Title of the video",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: VideoContainer(
                            img:
                                "https://i1.wp.com/codigoespagueti.com/wp-content/uploads/2014/06/GIF.gif?fit=640%2C360&quality=80&ssl=1",
                            title: "Title of the video",
                          ),
                        ),
                      ],
                    ),
                  ),
                )
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
