import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
}
