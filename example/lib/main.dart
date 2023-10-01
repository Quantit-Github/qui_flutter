import 'package:example/pages/toggle/toggle_page.dart';
import 'package:flutter/material.dart';
import 'package:qui_flutter/core/qui_theme.dart';
import 'package:qui_flutter/style/base_color/primary_color.dart';
import 'package:qui_flutter/style/color_palette.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///
  /// CHECK: QUI theme를 현새 Preference에 저장된 값에서 불러오는것을 [QuiTheme]에서 위젯에서 가져오고 있음.
  /// 이런 방식을 줘야 하는것인가?
  /// 실제 기기의 light, dark 관련 설정은 일반적으로 initialize 함수에서 기본적으로 매핑하게 설정 하는것이 맞아 보임.
  /// 따라서, initial 관련 함수를 추가해서 해당 themeMode로 Preference에 저장하는식으로 구성 해야 하지 않을까? 하는 의견이 있습니다.
  ///
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
      colorPalette: QuiColorPalette().copyWith(
        primary: PrimaryColor().copyWith(
          s50: Colors.blue,
          s40: Colors.red,
          s30: Colors.green,
          s99: Colors.orange,
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
  void _toggleTheme(BuildContext context) =>
      QuiTheme.of(context).toggleThemeMode();

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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      QuiTheme.of(context).colorPalette.grayScale.s30,
                  textStyle: QuiTheme.textTheme(context).titleSmall,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TogglePage(),
                  ),
                ),
                child: const Text("ToggleButton"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _toggleTheme(context),
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
