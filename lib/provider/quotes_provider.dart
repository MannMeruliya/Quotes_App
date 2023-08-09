import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class QuotesProvider extends ChangeNotifier {
  List quoteslist= [];
  bool isLoading = false;

  getquotes() async {
    String BASE_URL = "https://api.api-ninjas.com/v1/quotes";
    String category = "";

    Uri url = Uri.parse("$BASE_URL?category=$category");
    var response = await http.get(url, headers: {
      "X-Api-Key": "3Vj+dDPyJu4IHYe6DBl1Fg==KzDhdnaU7rpOy3HT",
    });
    print("Status code :: ${response.statusCode}");
    if (response.statusCode == 200) {
      quoteslist.addAll(json.decode(response.body));
      print(quoteslist);
      print(quoteslist[0]['quote']);
      isLoading = false;
    } else {
      Fluttertoast.showToast(
        msg: "Something Wrong...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
    isLoading = false;
  }
}