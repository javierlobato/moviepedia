import 'package:flutter_dotenv/flutter_dotenv.dart';




class Environment {

  static String movieDbToken = dotenv.env['THE_MOVIEDB_TOKEN'] ?? 'No hay api Key';
}
