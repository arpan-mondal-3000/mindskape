import 'package:http/http.dart';
import 'dart:convert';

class MentalhealthNews{
  late List articles = [];

  Future<void> getNews() async{
    try{
      //make the request
      // print('making request');
      Response response = await get(Uri.parse('https://newsapi.org/v2/everything?q=depression%20or%20anxiety%20or%20mental%20health&from=\$14-02-24&sortBy=publishedAt&apiKey=b8785bf074204bcfa456c5b2b5989ffd'));
      Map data = jsonDecode(response.body);
      //get properties from data
      for(int i = 0; i < 20; i++){
        List currentArticle = [];
        String title = data['articles'][i]['title'] ?? 'No data available.';
        String url = data['articles'][i]['url'] ?? '';
        String urlToImage = data['articles'][i]['urlToImage'] ?? 'https://placehold.co/600x400?text=Not+Available&font=poppins';
        String publishedAt = data['articles'][i]['publishedAt'].substring(0, 10) ?? 'No data available.';
        currentArticle.add(title);
        currentArticle.add(url);
        currentArticle.add(urlToImage);
        currentArticle.add(publishedAt);

        articles.add(currentArticle);
      }
    }
    catch (e){
      // print('caught error: $e');
      // articles = [['No data available'], [''], ['https://placehold.co/600x400?text=Not+Available&font=poppins'], ['No data available']];
    }
  }
}
