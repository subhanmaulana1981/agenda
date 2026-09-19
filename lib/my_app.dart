import 'package:agenda/layanans/layanan_agenda.dart';
import 'package:agenda/layars/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LayananAgenda(),
      child: MaterialApp(
        title: 'Agenda',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
              seedColor: Colors.grey
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
              seedColor: Colors.black
          ),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: const MyHomePage(
          selectedIndex: 0,
          title: 'Agenda Demo'
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
