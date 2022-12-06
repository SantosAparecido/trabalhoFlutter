import 'package:automec/models/sound.dart';
import 'package:automec/models/usuario.dart';
import 'package:automec/pages/preLoginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';


Future<void> main() async{

    await Hive.initFlutter();
    await Hive.openBox('Themedata');
    runApp(
      MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cliente(),
        ),
        ChangeNotifierProvider(
          create: (context) => Usuario(),
        ),
      ],
      child: MyApp(),
    ),);
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('Themedata').listenable(), 
      builder: (context, box, widget){
        final isDark = box.get('isDark', defaultValue: false);
        ThemeMode change = ThemeMode.dark;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: isDark ? ThemeData.dark() : ThemeData.light(),
          home:  PreLoginPage(),
        );
      }
    );
  }
}