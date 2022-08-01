part of 'downloads_bloc.dart';

@freezed
class DownloadState with _$DownloadState{
  const factory DownloadState({
    required bool isLoading,
     List<Downloads>? downloads
  }) = _DownloadState;
}
