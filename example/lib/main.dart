import 'package:example/pages/toggle/toggle_page.dart';
import 'package:flutter/material.dart';
import 'package:qui_flutter/core/qui_theme.dart';
import 'package:qui_flutter/style/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return QuiTheme(
      initialThemeMode: ThemeMode.system,
      // light: LightColorPalette().copyWith(
      //   primary: LightPrimary().copyWith(
      //     s50: Colors.blue,
      //     s40: Colors.red,
      //     s30: Colors.green,
      //     s99: Colors.orange,
      //   ),
      // ),
      // dark: DarkColorPalette().copyWith(
      //   primary: DarkPrimary().copyWith(
      //     s50: Colors.red,
      //     s40: Colors.red,
      //     s30: Colors.orange,
      //     s99: Colors.green,
      //   ),
      // ),
      builder: (light, dark, mode) => MaterialApp(
        theme: light,
        darkTheme: dark,
        title: 'Flutter Demo',
        themeMode: mode,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TextStyle? buttonTextStyle = QuiTheme.getTextTheme(context).titleSmall;

    return Scaffold(
      appBar: AppBar(
        title: Text(QuiTheme.getThemeMode(context).toString()),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: QuiTheme.of(context).palette.primary.s80,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TogglePage(),
                  ),
                ),
                child: Text(
                  "ToggleButton",
                  style: buttonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => QuiTheme.of(context).toggleThemeMode(),
        child: Builder(builder: (context) {
          final themeMode = QuiTheme.of(context).themeMode;
          if (themeMode.value == ThemeMode.light) {
            return const Icon(Icons.light_mode);
          } else if (themeMode.value == ThemeMode.dark) {
            return const Icon(Icons.dark_mode);
          } else {
            return const Icon(Icons.settings_brightness);
          }
        }), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
