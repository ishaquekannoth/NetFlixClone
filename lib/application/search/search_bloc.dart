import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixproject/domain/core/failures/main_failure.dart';
import 'package:netflixproject/domain/downloads/i_deownloads_repo.dart';
import 'package:netflixproject/domain/downloads/models/downloads.dart';
import 'package:netflixproject/domain/search/model/search_resp/search_resp.dart';
import 'package:netflixproject/domain/search/model/search_resp/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._searchService, this._downloadsService)
      : super(SearchState.initial()) {
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(state);
        return;
      }
      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      final _result = await _downloadsService.getDownloadsImages();
      final _state = _result.fold((MainFailure) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false);
      });
      emit(_state);
    });

    on<SearchMovie>(
      (event, emit) async {
        emit(const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: true,
            isError: false));
        final _result =
            await _searchService.searchMovies(movieQuery: event.movieQuery);
        final _state = _result.fold((MainFailure f) {
          return const SearchState(
              searchResultList: [],
              idleList: [],
              isLoading: false,
              isError: true);
        }, (SearchResp r) {
          return SearchState(
              searchResultList: r.results!,
              idleList: [],
              isLoading: false,
              isError: false);
        });

        emit(_state);
      },
    );
  }
}
