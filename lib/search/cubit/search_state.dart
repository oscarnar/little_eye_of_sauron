part of 'search_cubit.dart';

@immutable
class SearchState extends Equatable {
  const SearchState({
    required this.isSearching,
    this.suggestions = const <String>[],
    this.results = const <Video>[],
  });
  final bool isSearching;
  final List<String> suggestions;
  final List<Video> results;

  @override
  List<Object?> get props => [isSearching, suggestions];
}

class SearchInitial extends SearchState {
  const SearchInitial() : super(isSearching: false);
}

class SearchQueryChanged extends SearchState {
  const SearchQueryChanged(List<String> suggestions)
      : super(
          isSearching: true,
          suggestions: suggestions,
        );
}

class SearchLoaded extends SearchState {
  const SearchLoaded(List<Video> results)
      : super(
          isSearching: false,
          results: results,
        );
}

class SearchLoading extends SearchState {
  const SearchLoading()
      : super(
          isSearching: false,
        );
}
