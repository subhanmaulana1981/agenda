
import 'package:agenda/layanans/layanan_agenda.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DaftarAgenda extends StatefulWidget {
  const DaftarAgenda({super.key});

  @override
  State<DaftarAgenda> createState() => _DaftarAgendaState();
}

class _DaftarAgendaState extends State<DaftarAgenda> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      context.read<LayananAgenda>().todos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LayananAgenda>(
      builder: (context, layananAgenda, child) {
        // 1. loading state
        if (layananAgenda.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        // 2. error state
        if (layananAgenda.stringError != null) {
          return Center(
            child: Text(layananAgenda.stringError!),
          );
        }

        // 3. empty state
        if (layananAgenda.todos.isEmpty) {
          return Center(
            child: Text('Tidak ada data'),
          );
        }

        // 4. data sukses state
        return ListView.builder(
          itemCount: layananAgenda.length,
          itemBuilder: (context, index) {
            final todo = layananAgenda.todos[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(todo.title),
              trailing: Icon(
                todo.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
                color: todo.isCompleted ? Colors.green : Colors.grey,
              ),
            );
          }
        );
      }
    );
  }
}
