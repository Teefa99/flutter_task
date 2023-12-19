import 'package:task/base/base_repositroy.dart';

abstract class ISplashRepository {}

class SplashRepository extends BaseRepository implements ISplashRepository {
  SplashRepository({required this.provider});
  final ISplashProvider provider;
}

class ISplashProvider {}
