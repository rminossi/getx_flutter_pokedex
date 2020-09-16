import 'package:pokedex/app/data/provider/api.dart';
import 'package:meta/meta.dart';

class MyRepository {
  final MyApiClient apiClient;

  MyRepository({@required this.apiClient}) : assert(apiClient != null);

  getAll() {
    return apiClient.getAll();
  }

  getImage(String num) {
    return apiClient.getImage(num);
  }

  getId(id) {
    return apiClient.getId(id);
  }



}
