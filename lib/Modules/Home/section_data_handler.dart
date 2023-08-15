class SectionDataHandler {
  // static Future<Either<Failure, List<SectionModel>>> getSections()async{
  //   await Future.delayed(const Duration(seconds: Constants.loadingDuration));
  //   return Right(SectionModel.mockList);
  //    // ignore: dead_code
  //    try {
  //      List<SectionModel> response = await GenericRequest<SectionModel>(
  //        method: RequestApi.get(url: APIEndPoint.test,),
  //        fromMap: SectionModel.fromMap,
  //      ).getList();
  //
  //     return Right(response);
  //   } on ServerException catch (failure) {
  //     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
  //   }
  // }
  //
  // static Future<Either<Failure, SectionModel>> getSectionById({required int id})async{
  //   await Future.delayed(const Duration(seconds: Constants.loadingDuration));
  //   return Right(SectionModel());
  //   // ignore: dead_code
  //   try {
  //     SectionModel response = await GenericRequest<SectionModel>(
  //       method: RequestApi.get(url: APIEndPoint.test,),
  //       fromMap: SectionModel.fromMap,
  //     ).getObject();
  //
  //     return Right(response);
  //   } on ServerException catch (failure) {
  //     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
  //   }
  // }
  //
  // static Future<Either<Failure, SectionModel>> insertUpdateSection({required SectionModel sectionModel})async{
  //   await Future.delayed(const Duration(seconds: Constants.loadingDuration));
  //   return Right(sectionModel);
  //   // ignore: dead_code
  //   try {
  //     RequestApi method = RequestApi.post(url: APIEndPoint.test, body: sectionModel.toJson());
  //     SectionModel response = await GenericRequest<SectionModel>(
  //       method: method,
  //       fromMap: SectionModel.fromMap,
  //     ).getObject();
  //
  //     return Right(response);
  //   } on ServerException catch (failure) {
  //     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
  //   }
  // }
  //
  // static Future<Either<Failure, bool>> deleteSection({required int id}) async{
  //   await Future.delayed(const Duration(seconds: Constants.loadingDuration));
  //   return const Right(true);
  //   // ignore: dead_code
  //   try {
  //     bool response = await GenericRequest<bool>(
  //       method: RequestApi.delete(
  //         url: APIEndPoint.test,
  //       ),
  //       fromMap: (_)=> _["status"] == "true",
  //     ).getResponse();
  //
  //     return Right(response);
  //   } on ServerException catch (failure) {
  //     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
  //   }
  // }
}
