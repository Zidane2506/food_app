import 'dart:convert';
import 'dart:io';

import 'package:food_app/model/models.dart';
import 'package:http/http.dart' as http;

part 'food_services.dart';
part 'transaction_services.dart';
part 'user_services.dart';

String baseUrl = 'https://food.rtid73.com/api';