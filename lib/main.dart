import 'package:case_study_3_app/common/widgets/app_bar.dart';
import 'package:case_study_3_app/common/widgets/menu.dart';
import 'package:case_study_3_app/screens/example/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.456240
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://test-map-node.onrender.com/home'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SizedBox(width: 250, child: Menu(scaffoldKey: _scaffoldKey)),
      appBar: MainAppBar(background: Colors.blue,
        title: 'My App',
        actions: [
          GestureDetector(
            onTap: () {
              print('Click Thông báo');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExampleWidget(title: 'Thông báo'),)
              );
            },
            child: SvgPicture.asset(
              'assets/svg/bell.svg',
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10.0,
          )
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}

//
// import 'package:case_study_3_app/string_accesstoken.dart';
// import 'package:flutter/material.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late MapboxMapController mapController;
//   var currentLocationNotifier = ValueNotifier(const LatLng(16, 108));
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Flutter Simple Example')),
//       body: ValueListenableBuilder<LatLng>(
//         valueListenable: currentLocationNotifier,
//         builder: (context, value, _) {
//           return MapboxMap(
//             styleString: StringDemoMap.styleMap,
//             onMapCreated: (controller) => {
//               mapController = controller,
//             },
//             initialCameraPosition: CameraPosition(
//               target: value,
//               zoom: 14,
//             ),
//             accessToken: StringDemoMap.accessToken,
//           );
//         },
//       ),
//     );
//   }
// }
