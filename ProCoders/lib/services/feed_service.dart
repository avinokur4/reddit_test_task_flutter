import '../http/http_client.dart';
import '../repositories/repository.dart';

abstract class IWalletsListService {
  Future<Map<String, dynamic>> fetchWalletsList(String url);
}

class WalletsListService extends IWalletsListService {
  final IRepository repository = Repository(DomainType.brokerage);

  @override
  Future<Map<String, dynamic>> fetchWalletsList(String url) async {
    return await repository.fetch(url) as Map<String, dynamic> ;
  }
}
