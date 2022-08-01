import 'package:dartz/dartz.dart';
import 'package:netflixproject/domain/core/failures/main_failure.dart';
import 'package:netflixproject/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo {
  late Future<Either<MainFailure, List<Downloads>>> getDownloadsImages;
}
