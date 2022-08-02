import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixproject/domain/core/failures/main_failure.dart';
import 'package:netflixproject/domain/hot_and_new_resp/hot_and_new_service.dart';
import 'package:netflixproject/domain/hot_and_new_resp/model/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    emit(HotAndNewState(
        comingSoonList: [],
        everyOneIsWatchingList: [],
        isLoading: true,
        hasError: false));

    on<LoadDataInComingSoon>((event, emit) async {
      final result = await _hotAndNewService.getHotAndNewMovieData();
      final _state = result.fold((MainFailure failure) {
        return (const HotAndNewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: true));
      }, (HotAndNewResp resp) {
        return (HotAndNewState(
            comingSoonList: resp.results,
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: false));
      });
      emit(_state);
    });
    on<LoadDataInEveryoneWatching>((event, emit) async {

      
    });
  }
}
