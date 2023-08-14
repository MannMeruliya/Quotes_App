import 'package:db_miner/controller/quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    var controller = Get.put(QuotesController());
    controller.getquotes();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: QuotesController(),
      builder: (QuotesController controller) => Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "DB Miner",
            style: TextStyle(fontSize: 25),
          ),
          actions: [
            IconButton(
              onPressed: () {
                controller.getquotes();
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: controller.quoteslist.length,
          itemBuilder: (context, index) {
            return Container(
              height: 755,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.black54,
              ),
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${controller.quoteslist[index].quote}",
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "Author :- ${controller.quoteslist[index].author}",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}