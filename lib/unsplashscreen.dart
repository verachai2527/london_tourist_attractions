import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather_widget/open_weather_widget.dart';

class UnsplashAPI extends StatefulWidget {
  const UnsplashAPI({Key? key}) : super(key: key);

  @override
  State<UnsplashAPI> createState() => _UnsplashAPIState();
}

class _UnsplashAPIState extends State<UnsplashAPI> {
  List<dynamic> imageData = [];
  var data;

  Future<String> getjsondata() async {
    try {
      Uri myUri = Uri.parse(
          "https://api.unsplash.com/search/photos?per_page=30&client_id=0JouE-40YTdtqfgvOrBfsUdJb3r8SSh6IgjdXGxWwsM&query=london attraction");
      http.Response response = await http.get(myUri);
      setState(() {
        var converted = json.decode(response.body);
        data = converted['results'];
        // print(data);
      });
    } catch (e) {}
    return 'success';
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    getjsondata();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Text('GALLERY',
                  style: TextStyle(
                      backgroundColor: Color.fromARGB(255, 249, 223, 162),
                      fontSize: 50)),
            ),
            Container(height: 800, child: staggeredGridView()),
          ],
        ),
      ),
    );
  }

  MasonryGridView staggeredGridView() {
    return MasonryGridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 24,
      crossAxisSpacing: 12,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) => Image.network(
        data[index]['urls']['small'],
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
