import 'dart:convert';
import 'package:muratmakasci/model/musteri.dart';
import 'package:http/http.dart' as http;

class MusteriService {
  Future<List<Musteri>> getMusteri(String telefon) async {
    final String url =
        "https://muratmakasci.com/crm/rest_api/index.php?telefon=$telefon";

    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body);
    List<Musteri> musteri = List.empty(growable: true);

    for (var element in resp) {
      Musteri task = Musteri.fromJson(element);

      musteri.add(task);
    }

    return musteri;
  }
}
