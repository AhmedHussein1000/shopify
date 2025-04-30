import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../models/contacts_response_model.dart';
abstract class BaseContactUsRepo {
  Future<Either<Failure,ContactsResponseModel>> getContacts();
}