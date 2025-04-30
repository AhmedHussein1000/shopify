import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../models/faqs_model.dart';

abstract class BaseFAQsRepo {
  Future<Either<Failure,FAQsModel>> getFAQs();
}