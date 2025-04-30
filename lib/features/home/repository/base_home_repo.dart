import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../models/home_model/home_data_model.dart';
abstract class BaseHomeRepo {
  Future<Either<Failure, HomeDataModel>> getHomeData();
}