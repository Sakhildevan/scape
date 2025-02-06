import 'package:dartz/dartz.dart';
import 'package:scape/core/error/exceptions.dart';
import 'package:scape/core/error/failure.dart';
import 'package:scape/core/utils/typedef.dart';
import 'package:scape/src/home/data/data_source/home_data_source.dart';
import 'package:scape/src/home/data/model/user_model.dart';

class HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepository({required HomeDataSource homeDataSource})
      : _homeDataSource = homeDataSource;
  ResultFuture<List<UserModel>> getUsers() async {
    try {
      final result = await _homeDataSource.getUsers();
      return Right(result);
    } on APIException catch (e) {
      return Left(
        APIFailure.fromException(e),
      );
    }
  }
}
