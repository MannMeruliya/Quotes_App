import 'dart:convert';
import 'package:db_miner/model/quotes_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class QuotesController extends GetxController {
  List<Quotes> quoteslist = [];

  Future<void> getquotes() async {
    String baseUrl = "https://api.api-ninjas.com/v1/quotes";
    String category = "";

    Uri url = Uri.parse("$baseUrl?category=$category");
    var response = await http.get(url, headers: {
      "X-Api-Key": "3Vj+dDPyJu4IHYe6DBl1Fg==KzDhdnaU7rpOy3HT",
    });
    print("Status code :: ${response.statusCode}");
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      quoteslist = responseData
          .map((quote) =>
          Quotes(
              quote: quote['quote'],
              author: quote['author'],
              category: quote['category']))
          .toList();
      _saveQuotes(quoteslist);
      print(quoteslist);
    }
    update();
  }

  Future<void> _saveQuotes(List<Quotes> quoteslist) async {
    final dbPath = await getDatabasesPath();
    final databasePath = join(dbPath, 'quotes.db');
    final database = await openDatabase(databasePath, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
           quote TEXT, author TEXT, category TEXT ''');
        });

    for (var quote in quoteslist) {
      await database.insert(
        'quotes',
        quote.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    // TODO: implement update
    super.update(ids, condition);
  }
}