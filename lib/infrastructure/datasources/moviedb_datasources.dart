import 'package:dio/dio.dart';
import 'package:moviepedia/config/constants/environment.dart';
import 'package:moviepedia/domain/datasources/movies_datasources.dart';
import 'package:moviepedia/domain/entities/movie.dart';
import 'package:moviepedia/infrastructure/mappers/movie_mappers.dart';
import 'package:moviepedia/infrastructure/models/moviedb/moviedb_response.dart';

class MovieDbDataSource extends MoviesDatasource {
  final dio = 
  Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'languaje': 'es-MX'},
      headers: {'Authorization': 'Bearer ${Environment.movieDbToken}'},
      )
      );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =await dio.get('/movie/now_playing');

    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
      .where((moviedb) => moviedb.posterPath != 'no-poster')
      .map((moviedb) => MovieMapper.movieDBToEntity(moviedb)
      ).toList();

    return movies;
  }
}
