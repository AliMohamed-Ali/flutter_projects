import 'package:dartz/dartz.dart';

abstract class HomeRepo
{
  Future <Either<fail>> fetchEBestSellerBooks();
  Future <Either<fail>> fetchFeaturedBooks();
}