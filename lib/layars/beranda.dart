
import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  // properti
  final ValueChanged<int>? onItemTapped;

  // konstruksi
  const Beranda({
    super.key,
    this.onItemTapped,
  });

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      /* teks */
      SizedBox(height: 32),
      Text(
        'Halo, Subhan Maulana!',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      Text(
        'Rapikan tugasmu hari ini yah..',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      SizedBox(height: 32),

      /* cards */
      // 1. tambah agenda
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Theme.of(context).colorScheme.secondaryContainer,
          elevation: 8,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButtonTheme(
                    data: IconButtonThemeData(
                      style: ButtonStyle(
                        iconColor: WidgetStateColor.resolveWith((states) {
                          return Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer;
                        }),
                      ),
                    ),
                    child: IconButton.filledTonal(
                      iconSize: 64,
                      onPressed: () {
                        widget.onItemTapped?.call(1);
                      },
                      icon: Icon(
                        Icons.fiber_new,
                      )
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Buat tugas baru',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Buat tugas baru di agenda',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(height: 16),

                      TextButton(
                        onPressed: () {
                          widget.onItemTapped?.call(1);
                        },
                        child: Text('Tambah baru'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // 2. lihat agenda
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Theme.of(context).colorScheme.secondaryContainer,
          elevation: 8,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButtonTheme(
                    data: IconButtonThemeData(
                      style: ButtonStyle(
                        iconColor: WidgetStateColor.resolveWith((states) {
                          return Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer;
                        }),
                      ),
                    ),
                    child: IconButton.filledTonal(
                        iconSize: 64,
                        onPressed: () {
                          widget.onItemTapped?.call(2);
                        },
                        icon: Icon(
                          Icons.checklist,
                        )
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lihat semua tugas',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Lihat dan atur tugasmu',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(height: 16),

                      TextButton(
                        onPressed: () {
                          widget.onItemTapped?.call(2);
                        },
                        child: Text('Lihat semua'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
