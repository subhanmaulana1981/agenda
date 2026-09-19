import 'package:agenda/layars/daftar_agenda.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:agenda/layars/beranda.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.selectedIndex,
    required this.title,
  });

  final int selectedIndex;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pages = [
      Beranda(onItemTapped: _onItemTapped),
      Text('Tambah Agenda'),
      DaftarAgenda(),
      Text('Pengaturan'),
    ];

  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (kDebugMode) {
      print('index saat ini: $_selectedIndex');
    }
  }

  late List<Widget> _pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications)
          ),
          SizedBox(width: 8),

          CircleAvatar(
            child: Icon(Icons.person),
          ),
          SizedBox(width: 8),
        ],
        elevation: 8,
        centerTitle: true,
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        elevation: 8,
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(8),
          children: <Widget>[
            // 1. drawer header
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
              margin: EdgeInsets.all(8),
              currentAccountPicture: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 48,
                ),
              ),
              currentAccountPictureSize: Size.square(64),
              accountName: Text(
                'Subhan Maulana',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              accountEmail: Text(
                'SubhanMaulana1981@gmail.com',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            // 2. beranda
            Card(
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTileTheme(
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Beranda'),
                    subtitle: Text('Kembali ke beranda'),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                  ),
                ),
              ),
            ),
            // 3. tambah agenda
            Card(
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTileTheme(
                  child: ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Tambah Agenda'),
                    subtitle: Text('Tambah agenda baru'),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                  ),
                ),
              ),
            ),
            // 4. lihat agenda
            Card(
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTileTheme(
                  child: ListTile(
                    leading: Icon(Icons.checklist),
                    title: Text('Lihat Agenda'),
                    subtitle: Text('Lihat semua agenda'),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                  ),
                ),
              ),
            ),
            // 5. pengaturan
            Card(
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTileTheme(
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Pengaturan'),
                    subtitle: Text('Pengaturan aplikasi'),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        _selectedIndex = 3;
                      });
                    },
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          // 1. beranda
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
            label: 'Beranda',
            tooltip: 'Beranda',
          ),
          // 2. tambah agenda
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
            label: 'Tambah Agenda',
            tooltip: 'Tambah Agenda',
          ),
          // 3. lihat agenda
          BottomNavigationBarItem(
            icon: Icon(
              Icons.checklist,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
            label: 'Lihat Agenda',
            tooltip: 'Lihat Agenda',
          ),
          // 4. pengaturan
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
            label: 'Pengaturan',
            tooltip: 'Pengaturan',
          ),
        ],
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.onSecondaryContainer,
        currentIndex: _selectedIndex,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        onTap: _onItemTapped,
        ),
      backgroundColor: Theme.of(context).colorScheme.surfaceBright,
    );
  }
}
