
import 'package:shop_app/core/network/api_error_model.dart';

abstract class CustomException implements Exception{
final ApiErrorModel apiErrorModel;

const CustomException(this.apiErrorModel);
}
class ServerException extends CustomException{
  const ServerException(super.apiErrorModel);

}