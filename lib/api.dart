import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyCF0KzX6-iAyMod5PZhBnKg1Yg_F9AtFgM";
const ID_CANAL = "UCYcClChNM-0rjqCGobSfJ4A";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class API {
  Future<List<Video>> pesquisar(String pesquisa) async {
    print("Running API.pesquisar()...");
    http.Response response = await http.get(Uri.parse(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa"));

    Map<String, dynamic> dadosJson = json.decode(response.body);
    List<Video> videos = dadosJson["items"].map<Video>((map) {
      return Video.fromJson(map);
      //return Video.converterJson(map);
    }).toList();

    return videos;

    //print("resultado: " + dadosJson["items"][0]["snippet"]["title"].toString());
  }
}
