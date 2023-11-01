import 'package:example/components/toggle_theme.dart';
import 'package:example/pages/checkbox.dart';
import 'package:example/pages/toggle.dart';
import 'package:flutter/material.dart';
import 'package:qui_flutter/qui_flutter.dart';
import 'package:qui_flutter/style/constant.dart';

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
      initialThemeMode: ThemeMode.light,
      light: QUI_LIGHT_PALETTE.copyWith(
        extension: {
          "custom": ColorRange.withOpacity(color: Colors.green),
        },
      ),
      dark: QUI_DARK_PALETTE.copyWith(
        extension: {
          "custom": ColorRange.withOpacity(color: Colors.blue),
        },
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

class PageRouteButton extends StatelessWidget {
  final Widget page;
  final String title;
  const PageRouteButton({super.key, required this.page, required this.title});

  @override
  Widget build(BuildContext context) {
    QuiColorPalette color = QuiTheme.of(context).color;
    QuiTypography typography = QuiTheme.typography(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color.primary.s90,
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Text(title, style: typography.titleSmall.bold),
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
  QuiColorPalette get color => QuiTheme.of(context).color;
  QuiTypography get typography => QuiTheme.typography(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example App", style: typography.titleLarge.bold),
        backgroundColor: color.primary.s90,
        scrolledUnderElevation: 1,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.only(top: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              PageRouteButton(
                page: TogglePage(),
                title: "TogglePage",
              ),
              PageRouteButton(page: CheckBoxPage(), title: "CheckBoxPage")
            ],
          ),
        ),
      ),
      floatingActionButton: const ToggleTheme(),
    );
  }
}
