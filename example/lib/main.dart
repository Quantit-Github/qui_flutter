import 'package:flutter/material.dart';
import 'package:qui_flutter/core/qui_theme.dart';
import 'package:qui_flutter/style/base_color/primary_color.dart';
import 'package:qui_flutter/style/color_pallete.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final savedThemeMode = await QuiTheme.getThemeMode();
  runApp(MyApp(themeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  const MyApp({
    required this.themeMode,
    super.key,
  });

  final ThemeMode themeMode;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return QuiTheme(
      initThemeMode: themeMode,
      lightColorPallete: QuiLightColorPallete().copyWith(
        primary: PrimaryColor().copyWith(
          s100: Colors.orange,
          s50: Colors.blue,
          s40: Colors.red,
          s30: Colors.green,
          s99: Colors.orange,
        ),
      ),
      darkColorPallete: QuiDarkColorPallete().copyWith(
        primary: PrimaryColor().copyWith(
          s100: Colors.green,
          s50: Colors.black,
          s40: Colors.black,
          s30: Colors.black,
          s99: Colors.black,
        ),
      ),
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
  void _incrementCounter(BuildContext context) {
    QuiTheme.of(context).toggleThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(QuiTheme.of(context).getThemeMode()),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("StateOverlay :: Common / Hover / Pressed / Focused"),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: QuiTheme.of(context).colorPalette.primary.s100,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: QuiTheme.of(context).darkColorPalette.primary.s100,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: QuiTheme.of(context).lightColorPalette.primary.s100,
                  ),
                ],
              ),
              const Text("Buttons"),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: QuiTheme.of(context)
                      .colorTokens
                      .buttonTokens
                      .activePrimary
                      .container,
                ),
                child: Text(
                  "BTN/Active/Primary",
                  style: TextStyle(
                    color: QuiTheme.of(context)
                        .colorTokens
                        .buttonTokens
                        .activePrimary
                        .elements,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: QuiTheme.of(context)
                      .colorTokens
                      .buttonTokens
                      .activeSecondary
                      .container,
                ),
                child: Text(
                  "BTN/Active/Secondary",
                  style: TextStyle(
                    color: QuiTheme.of(context)
                        .colorTokens
                        .buttonTokens
                        .activeSecondary
                        .elements,
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                color: QuiTheme.of(context)
                    .colorTokens
                    .buttonTokens
                    .activeGhost
                    .elements,
                child: const Text(
                  "Button/Active/Ghost",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.amber),
                ),
              ),
              ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: QuiTheme.of(context)
                      .colorTokens
                      .buttonTokens
                      .activeDisabled
                      .container,
                ),
                child: Text(
                  "Button/Disabled",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: QuiTheme.of(context)
                        .colorTokens
                        .buttonTokens
                        .activeDisabled
                        .elements,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(context),
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
