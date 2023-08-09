import 'package:db_miner/provider/quotes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<QuotesProvider>(context).getquotes();
    return Consumer<QuotesProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Api",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: ListView.builder(
          itemCount: provider.quoteslist.length,
          itemBuilder: (context, index) =>
            Container(
              height: 700,
              color: Colors.black54,
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${provider.quoteslist[index]['quote']}",
                      style:  TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                     SizedBox(height: 22,),
                    Text(
                      "Category :- ${provider.quoteslist[index]['category']}",
                      style:  TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
        )
      ),
    );
  }
}



// ListView.builder(
//   itemCount: provider.quoteslist.length,
//   itemBuilder: (context, index) => ListTile(
//
//     title: Text(
//       "${provider.quoteslist[index]['quote']}",
//       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//     ),
//   ),
// )

// Container(
// margin: EdgeInsets.all(25),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// "${provider.quoteslist[index]['quote']}",
// style: TextStyle(
// fontSize: 25,
// color: Colors.white,
// ),
// ),
// SizedBox(height: 22,),
// Text(
// "Category :- ${provider.quoteslist[index]['category']}",
// style: TextStyle(
// fontSize: 20,
// color: Colors.white,
// ),
// ),
// ],
// ),
// ),