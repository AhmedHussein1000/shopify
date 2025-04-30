import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../models/categories_model/category_model.dart';

abstract class BaseCategoriesRepo {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
}