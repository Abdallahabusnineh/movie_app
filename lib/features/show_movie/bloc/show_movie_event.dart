part of 'show_movie_bloc.dart';

@immutable
sealed class ShowMovieEventAbstract {}

class MoviesLoadingEvent extends ShowMovieEventAbstract {}
