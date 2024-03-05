import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviepedia/infrastructure/datasources/moviedb_datasources.dart';
import 'package:moviepedia/infrastructure/repositories/movie_repository_impl.dart';



final movieRepositoryProvider = Provider((ref) => {


  //Este repositorio es inmutable y de solo lectura!!!
   MovieRepositoryImpl(MovieDbDataSources() )


});