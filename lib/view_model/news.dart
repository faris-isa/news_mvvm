import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news.dart';

class NewsViewModel {  
  Future<NewsModels> getNews() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=id&apiKey=9fecdaa9e7324729936847f742268e8c'));
      final data = jsonDecode(response.body);
      if (data['status'] == 'error') {
        throw Exception(
            'Error while getting the data. code: ${data['code']}, details: ${data['message']}');
      }

      return NewsModels.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load news');
    }
  }
}