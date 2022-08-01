import 'package:dio/dio.dart';
import 'package:netflixproject/domain/core/api_end_points.dart';
import 'package:netflixproject/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflixproject/domain/downloads/i_deownloads_repo.dart';
import 'package:netflixproject/domain/downloads/models/downloads.dart';

class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadsList = [];
        for (final raw in response.data) {
          downloadsList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        }
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
