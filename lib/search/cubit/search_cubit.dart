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
    'Organism',
    'Magenta',
    'Gas',
    'Technology',
    'Electricity',
    'Circle',
    'Darkness',
    'Logo',
    'Brand',
    'Electric blue',
    'Font',
    'Macro photography',
    'Graphics',
    'Sky',
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
    final response = await http.get(url);
    final result = jsonDecode(response.body) as List;
    final videosResult = <Video>[];
    for (var i = 0; i < result.length; i++) {
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
