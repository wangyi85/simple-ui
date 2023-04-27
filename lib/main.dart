import 'package:flutter/material.dart';
import 'info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple UI',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: buildMaterialColor(Color.fromARGB(255, 0, 138, 53))),
      home: const MyHomePage(title: 'App Name'),
    );
  }

  MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context) {
	return Scaffold(
		appBar: AppBar(
			title: Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: [
					Container(width: 60),
					Text(this.title),
					IconButton(
						onPressed: () {
							Navigator.push(context, MaterialPageRoute(builder: (context) => Info()));
						}, icon: const Icon(Icons.help_outline_rounded), iconSize: 30,
					)
				],
			)
		),
		body: Container(
			padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
			color: Colors.white,
			child: Column(
				mainAxisAlignment: MainAxisAlignment.spaceAround,
				crossAxisAlignment: CrossAxisAlignment.stretch,
				children: [
					Container(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								const Text(
									'Insert Name',
									style: TextStyle(
										fontWeight: FontWeight.bold,
									),
								),
								Container(
									margin: EdgeInsets.only(top: 5),
									child: TextFormField(
											decoration: const InputDecoration(
												filled: true,
												fillColor: Color.fromARGB(255, 242, 242, 250),
												hintText: 'Name',
												hintStyle: TextStyle(color: Color.fromARGB(255, 219, 220, 229)),
												border: InputBorder.none
										),
									),
								)

							],
						),
					),
					Container(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: const [
										Text(
											'Insert Serial Number',
											style: TextStyle(
												fontWeight: FontWeight.bold
											),
										),
										Icon(
											Icons.info_outline_rounded,
											color: Color.fromARGB(255, 0, 143, 53),
											size: 30
										)
									]
								),
								Container(
									margin: EdgeInsets.only(top: 5),
									child: TextFormField(
											decoration: const InputDecoration(
												filled: true,
												fillColor: Color.fromARGB(255, 242, 242, 250),
												hintText: 'Serial Number',
												hintStyle: TextStyle(color: Color.fromARGB(255, 219, 220, 229)),
												border: InputBorder.none
										),
									),
								)
							],
						),
					),
					Container(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								const Text(
									'Insert Phone Number',
									style: TextStyle(
										fontWeight: FontWeight.bold
									),
								),
								Container(
									margin: EdgeInsets.only(top: 5),
									child: TextFormField(
											decoration: const InputDecoration(
												filled: true,
												fillColor: Color.fromARGB(255, 242, 242, 250),
												hintText: 'Phone Number',
												hintStyle: TextStyle(color: Color.fromARGB(255, 219, 220, 229)),
												border: InputBorder.none
										),
									),
								)
							],
						),
					),
					ElevatedButton(
						style: ButtonStyle(
							padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
							foregroundColor: MaterialStateProperty.all(Colors.white),
							backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 0, 138, 53)),
							shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(borderRadius: BorderRadius.zero))
						),
						onPressed: () {
						},
						child: const Text(
							'CONTINUE',
							style: TextStyle(
								fontSize: 20
							)
						),
					),
				],
			),
		),
	);
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title, textAlign: TextAlign.center),
//         centerTitle: true,
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
