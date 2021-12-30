import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_eye_of_sauron/search/cubit/search_cubit.dart';
import 'package:little_eye_of_sauron/search/widgets/search_widget.dart';
import 'package:little_eye_of_sauron/search/widgets/video_container.dart';
import 'package:little_eye_of_sauron/ui_utils/colors.dart';
import 'package:little_eye_of_sauron/ui_utils/constans/assets.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
              SearchWidget(),
              const SizedBox(
                height: 50,
              ),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: PColors.white,
                      ),
                    );
                  }
                  if (state is SearchLoaded) {
                    if (state.results.isEmpty) {
                      return Center(
                        child: Text(
                          'No results found',
                          style: Theme.of(context).textTheme.headline3!.apply(
                                color: PColors.white,
                                fontWeightDelta: 1,
                              ),
                        ),
                      );
                    }
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 4 / 3,
                        ),
                        itemCount: state.results.length,
                        itemBuilder: (BuildContext context, int index) {
                          print(state.results[index].urlImage);
                          print(state.results[index].urlGif);
                          print(state.results[index].urlVideo);
                          return InkWell(
                            onTap: () {
                              // if (!await launch(
                              //     state.results[index].urlVideo)) {
                              //   throw 'Could not launch';
                              // }
                              launch(
                                'https://' + state.results[index].urlVideo,
                              );
                            },
                            child: VideoContainer(
                              img: 'https://' + state.results[index].urlGif,
                              // 'https://i1.wp.com/codigoespagueti.com/wp-content/uploads/2014/06/GIF.gif?fit=640%2C360&quality=80&ssl=1',
                              title: state.results[index].name,
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Container();
                },
              )
            ],
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
