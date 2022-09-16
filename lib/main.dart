// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:london_tourist_attractions/unsplashscreen.dart';
import 'package:london_tourist_attractions/weatherscreen.dart';
import 'package:london_tourist_attractions/weatherscreen2.dart';
import 'package:london_tourist_attractions/weatherscreen3.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';
import 'package:transparent_image/transparent_image.dart';

import 'location_map.dart';
import 'news_feed.dart';
import 'openweathermap.dart';

Future<void> main() async {
  //initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  //run app
  // runApp(FlutterUnsplash());
  runApp(ProviderScope(child: FlutterUnsplash()));
}

class FlutterUnsplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Material App
    return MaterialApp(
      title: 'Flutter Client',

      //Set the theme
      theme: ThemeData(
        accentColor: Colors.grey[400],
        canvasColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.black,

        //Card Theme
        cardColor: Colors.grey,
        cardTheme: const CardTheme(
          color: Colors.grey,
          elevation: 7,
          margin: EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),

        //Buttons
        buttonColor: Colors.black87,
        buttonTheme: ButtonThemeData(
          focusColor: Colors.black87,
          hoverColor: Colors.black87,
          buttonColor: Colors.black87,
          disabledColor: Colors.black87,
          highlightColor: Colors.black87,
          splashColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          minWidth: 100,
          height: 50,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(10),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          ),
        ),
      ),

      //Hide the debug banner
      debugShowCheckedModeBanner: false,

      //Homepage
      home: FutureBuilder<bool>(
        // future: checkIfSignedIn(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                sliverHeader(context),
                SliverToBoxAdapter(
                  child: tabContent(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox tabContent() {
    return SizedBox(
      height: 1000,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: new Size(0.0, 0.0),
              child: Container(
                height: 30,
                child: TabBar(
                  tabs: [
                    Container(
                        height: 20,
                        child:
                            Tab(icon: Icon(Icons.photo_camera_back_outlined))),
                    Container(
                        height: 20,
                        child: Tab(
                          icon: Icon(Icons.map),
                        )),
                    Container(height: 20, child: Tab(icon: Icon(Icons.feed))),
                  ],
                ),
              ),
            ),
            // title: const Text('GALLERY'),
          ),
          body: TabBarView(
            children: [
              const UnsplashAPI(),
              mainContent(),
              MyNewsFeed(),
            ],
          ),
        ),
      ),
    );
  }

  Column mainContent() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(height: 900, child: const Location()),
              flex: 3,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      // Container(height: 300, child: const Location()),
                      Container(
                          height: 900,
                          child: const OpenWeatherMapAPI(),
                          alignment: Alignment.topCenter),
                    ],
                  ),
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ],
    );
  }

  SliverPersistentHeader sliverHeader(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: FlexibleHeaderDelegate(
        statusBarHeight: MediaQuery.of(context).padding.top,
        expandedHeight: 240,
        collapsedHeight: 50,
        background: MutableBackground(
          expandedWidget: Image.asset(
            'images/london_header.jpg',
            fit: BoxFit.cover,
          ),
          collapsedColor: const Color(0xBE7A81FF),
        ),
        children: [
          FlexibleTextItem(
            text: 'London Tourist Attractions',
            collapsedStyle: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white),
            expandedStyle: Theme.of(context).textTheme.headline4?.copyWith(
                color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
            expandedAlignment: Alignment.centerLeft,
            collapsedAlignment: Alignment.center,
            expandedPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          FlexibleTextItem(
            text:
                'London, the capital of England and the United Kingdom, is a 21st-century\ncity with history stretching back to Roman times.At its centre stand\nthe imposing Houses of Parliament, the iconic ‘Big Ben’ clock tower and\nWestminster Abbey, site of British monarch coronations.',

            expandedStyle: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.white,
                  fontSize: 15,
                ),
            expandedAlignment: Alignment.bottomLeft,
            // collapsedAlignment: Alignment.center,
            expandedPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ],
      ),
    );
  }
}


// Future<bool> checkIfSignedIn() async {
//   AuthService authService = AuthService();
//   return await authService.checkIsSignedIn();
// }

