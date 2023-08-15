import 'package:dartz/dartz.dart';

import '../../../Core/API/generic_request.dart';
import '../../../Core/API/request_method.dart';
import '../../../Core/error/exceptions.dart';
import '../../../Core/error/failures.dart';
import '../../../Models/user_model.dart';
import '../../../Utilities/api_end_point.dart';

class DataHandler {
  static Future<Either<Failure, UserModel>> login(
      {required String userName, required String password}) async {
    try {
      UserModel response = await GenericRequest<UserModel>(
        method: RequestApi.post(
          url: APIEndPoint.login,
          body: {
            "username": userName,
            "password": password,
          },
        ),
        fromMap: UserModel.fromMap,
      ).getObject();

      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
