import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixproject/domain/downloads/i_deownloads_repo.dart';
import 'package:netflixproject/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

ValueNotifier<Set<int>> likedVideosByIdNotifier = ValueNotifier({});

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
];

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDownloadsRepo _downloadService)
      : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      emit(const FastLaughState(
        videosList: [],
        isLoading: true,
        isError: false,
      ));
      final _result = await _downloadService.getDownloadsImages();
      final _state = _result.fold((l) {
        const FastLaughState(
          videosList: [],
          isLoading: false,
          isError: true,
        );
      }, (resp) {
        return FastLaughState(
          videosList: resp,
          isLoading: false,
          isError: false,
        );
      });

      emit(_state!);
    });

    on<LikeVideo>((event, emit) async {
      likedVideosByIdNotifier.value.add(event.id);
      likedVideosByIdNotifier.notifyListeners();
    });
    on<UnLikeVideo>((event, emit) async {
      likedVideosByIdNotifier.value.remove(event.id);
      likedVideosByIdNotifier.notifyListeners();
    });
  }
}
