import 'home_repository.dart';

class MockHomeRepositoryApi implements HomeRepository {
  @override
  Future getStarwarsList() {
    throw UnimplementedError();
  }
}
