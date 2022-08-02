import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixproject/domain/core/api_end_points.dart';
import 'package:netflixproject/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflixproject/domain/hot_and_new_resp/hot_and_new_service.dart';
import 'package:netflixproject/domain/hot_and_new_resp/model/hot_and_new_resp.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplimentation implements HotAndNewService{
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData()async {

  try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.hotAndNewMovie);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } 
    catch (e) {
      return const Left(MainFailure.clientFailure());
    } 
  }

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData()async {

     try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.hotAndNewTv);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } 
    catch (e) {
      return const Left(MainFailure.clientFailure());
    }

  }
  
}