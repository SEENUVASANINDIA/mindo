// ignore_for_file: sort_child_properties_last
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:mindo/banner_adds.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ambidextrous',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Ambidextrous'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // Load ads.
  }

//ca-app-pub-3940256099942544/6300978111

  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-3940256099942544/6300978111',
    size: AdSize.banner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  )..load();
  final AdSize adSize = const AdSize(height: 320, width: 100);
  final BannerAdListener listener = BannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );

//.myBanner.load();
//Adstate.myBanner.load();

  int _counter = 0;
  int incrementer = 1;
  int decrementer = 1;
  void _incrementCounter() {
    setState(() {
      _counter = _counter + incrementer;
    });
  }

  void _deccrementCounter() {
    setState(() {
      _counter = _counter - decrementer;
    });
  }

  void _incrementer() {
    setState(() {
      incrementer++;
    });
  }

  void _decrementer() {
    setState(() {
      decrementer++;
    });
  }

  void _datareset() {
    setState(() {
      incrementer = 1;
      decrementer = 1;
    });
  }

  void _counterreset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: (MediaQuery.of(context).size.height / 7),
            width: (MediaQuery.of(context).size.width / 4),
          ),
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height / 6),
            width: (MediaQuery.of(context).size.width / 6),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              FloatingActionButton(
                onPressed: _deccrementCounter,
                child: const Icon(Icons.remove),
                tooltip: 'Left hand',
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height * 0),
                width: (MediaQuery.of(context).size.width / 1.5),
              ),
              FloatingActionButton(
                onPressed: _incrementCounter,
                child: const Icon(Icons.add),
                tooltip: 'Right hand',
              )
            ],
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height / 10),
            width: (MediaQuery.of(context).size.width * 0),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              FloatingActionButton(
                onPressed: _incrementCounter,
                child: const Icon(Icons.add),
                tooltip: 'Left hand',
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height * 0),
                width: (MediaQuery.of(context).size.width / 1.5),
              ),
              FloatingActionButton(
                onPressed: _deccrementCounter,
                child: const Icon(Icons.remove),
                tooltip: 'Right hand',
              )
            ],
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height / 10),
            width: (MediaQuery.of(context).size.width),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.04),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                FloatingActionButton(
                  onPressed: _incrementer,
                  child: const Icon(Icons.add),
                  tooltip: 'increase incrementer',
                ),
                FloatingActionButton(
                  onPressed: _decrementer,
                  child: const Icon(Icons.remove),
                  tooltip: 'increase decrementer',
                ),
                FloatingActionButton(
                  onPressed: _datareset,
                  child: const Icon(Icons.restore),
                  tooltip: 'data  reset',
                ),
                FloatingActionButton(
                  onPressed: _counterreset,
                  child: const Icon(Icons.restore),
                  tooltip: 'counter reset',
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: AdWidget(ad: myBanner),
            width: myBanner.size.width.toDouble(),
            height: myBanner.size.height.toDouble(),
          ),
        ],
      ),
    );
  }
}
