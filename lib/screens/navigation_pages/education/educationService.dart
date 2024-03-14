import 'package:http/http.dart';
import 'dart:convert';

class MentalhealthEducation{
  late List articles = [];

  Future<void> getEdNews() async{
    try{
      //make the request
      // print('making request');
      Response response = await get(Uri.parse('https://api.nhs.uk/mental-health?subscription-key=527dd456f8bb49c59f4d3fb75879eef3'));
      Map data = jsonDecode(response.body);
      //get properties from data
      for(int i = 0; i < data['hasPart'].length; i++){
        List currentArticle = [];
        String title = data['hasPart'][i]['headline'] ?? 'No data available.';
        String url = data['hasPart'][i]['url'] ?? '';
        String description = data['hasPart'][i]['description'] ?? 'No data available.';
        currentArticle.add(title);
        currentArticle.add(url);
        currentArticle.add(description);

        articles.add(currentArticle);
      }
    }
    catch (e){
      // print('caught error: $e');
      // articles = [['No data available'], [''], ['https://placehold.co/600x400?text=Not+Available&font=poppins'], ['No data available']];
    }
  }
}
