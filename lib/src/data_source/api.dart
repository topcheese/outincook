import 'dart:convert';

import '../view_models/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;

import '../domain/entities/entities.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

part 'recipe_repository.dart';
part 'user_repository.dart';
part 'ingredients_repository.dart';

const _endpoint = 'https://jsonplaceholder.typicode.com';

final _client = new http.Client();
