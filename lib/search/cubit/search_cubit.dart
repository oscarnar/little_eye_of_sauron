import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:little_eye_of_sauron/models/video/video_model.dart';
import 'package:little_eye_of_sauron/ui_utils/constans/globals.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchInitial());

  static final List<String> _labels = [
    'Car',
    'Bike',
    'Gun',
    'Person',
    'Cat',
    'Dog',
    'Organism',
    'Magenta',
    'Gas',
    'Technology',
    'Electricity',
    'Circle',
  ];

  void onSearchQueryChanged(String query) {
    if (query == '') {
      emit(const SearchInitial());
    } else {
      final searchResults = _labels
          .where(
            (String item) => item.toLowerCase().startsWith(
                  query.toLowerCase(),
                ),
          )
          .toList();
      emit(SearchQueryChanged(searchResults));
    }
  }

  void onSearch(String query) async {
    final url = Uri.parse(Global.url + query);
    emit(const SearchLoading());
    print(url);
    var response = await http.get(url);
    print(response);
    List result = jsonDecode(response.body) as List;
    // add(CompiledEvent(result: result['response']));
    List<Video> videosResult = [];
    for (var i = 0; i < result.length; i++) {
      print(result[i]['url_image'] as String);
      final video = Video(
        name: result[i]!['name'] as String,
        urlVideo: result[i]['url_video'] as String,
        urlImage: result[i]['url_image'] as String,
        etiqueta: result[i]['etiqueta'] as String,
        urlGif: result[i]['url_gif'] as String,
      );
      videosResult.add(video);
    }
    emit(SearchLoaded(videosResult));
  }
}
