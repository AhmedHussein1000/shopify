import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../models/about_us_model.dart';

abstract class BaseAboutUsRepo {
  Future<Either<Failure, AboutUsModel>> getAboutUsAndTerms();
}