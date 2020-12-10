import '../http/http_client.dart';
import '../repositories/repository.dart';

abstract class IFeedService {
  Future<Map<String, dynamic>> fetchFeed(String url);
}

class FeedService extends IFeedService {
  final IRepository repository = Repository(DomainType.brokerage);

  @override
  Future<Map<String, dynamic>> fetchFeed(String url) async {
    final result = (await repository.fetch(url)).data;
    return result['data'] as Map<String, dynamic>;
  }
}
