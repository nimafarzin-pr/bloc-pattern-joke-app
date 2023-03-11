import 'package:blocpatt/app/data/dataProvider/data_provider.dart';
import 'package:blocpatt/app/data/models/joke/joke_model.dart';
import 'package:blocpatt/core/res/url.dart';

class JokeRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<JokeModel> getJoke() async {
    try {
      dynamic response = await _apiServices.getApiResponse(AppUrl.jokeBaseUrl);
      return response = JokeModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
