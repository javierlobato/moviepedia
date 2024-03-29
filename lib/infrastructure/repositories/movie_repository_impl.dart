import 'package:moviepedia/domain/datasources/movies_datasources.dart';
import 'package:moviepedia/domain/entities/movie.dart';
import 'package:moviepedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
