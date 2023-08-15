import 'package:dartz/dartz.dart';

import '../../Core/API/generic_request.dart';
import '../../Core/API/request_method.dart';
import '../../Core/error/exceptions.dart';
import '../../Core/error/failures.dart';
import '../../Models/products_model.dart';
import '../../Utilities/api_end_point.dart';
import '../../Utilities/constants.dart';

class ProductsDataHandler {
  static Future<Either<Failure, List<ProductsModel>>> getProductsList() async {
    await Future.delayed(const Duration(seconds: Constants.loadingDuration));
    return Right(ProductsModel.mockList);
    try {
      List<ProductsModel> response = await GenericRequest<ProductsModel>(
        method: RequestApi.get(
          url: APIEndPoint.test,
        ),
        fromMap: ProductsModel.fromMap,
      ).getList();

      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
