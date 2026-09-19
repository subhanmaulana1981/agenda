
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agenda/models/todo.dart';
import 'package:flutter/foundation.dart';

class LayananAgenda extends ChangeNotifier {

  // private properties
  final String _stringUrl = String.fromEnvironment('BASE_URL');
  List<Todo> _todos = [];
  bool _isLoading = false;
  String? _stringError;

  // public getters
  List<Todo> get todos => _todos;
  int get length => _todos.length;
  bool get isLoading => _isLoading;
  String? get stringError => _stringError;

  // methods to fetch agendas
  Future<void> fetchTodos() async {
    _isLoading = true;
    notifyListeners();

    try {
      final authority = _stringUrl;
      Uri uriUrl = Uri.https(authority, '/todos');
      final response = await http.get(uriUrl, headers: {
        'Content-Type': 'application/json'
      });
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        _todos = jsonList.map((json) => Todo.fromJson(json)).toList();

      } else {
        _stringError = response.reasonPhrase;
      }

    } catch (e, stackTrace) {
      _stringError = e.toString();
      if (kDebugMode) {
        print(e);
        print(stackTrace);
      }

    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
