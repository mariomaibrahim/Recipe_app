import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/recipe_api.dart';

class ApiService {
  static const String baseUrl = "https://dummyjson.com";

  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(Uri.parse("$baseUrl/recipes"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List list = data['recipes'];
      return list.map((e) => Recipe.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load recipes");
    }
  }

  Future<Recipe> fetchRecipeById(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/recipes/$id"));
    if (response.statusCode == 200) {
      return Recipe.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load recipe details");
    }
  }
}