
import 'package:agenda/temas/theme.dart';
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
          useMaterial3: true,
          colorScheme: MaterialTheme.lightScheme(),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: MaterialTheme.darkScheme(),
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
