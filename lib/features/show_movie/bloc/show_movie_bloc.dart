import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/discover/repository/discover_repository.dart';
part 'show_movie_event.dart';
part 'show_movie_state.dart';

class ShowMovieBloc
    extends Bloc<ShowMovieEventAbstract, ShowMovieStateAbstract> {
  final DiscoverRepository repository;
  final BuildContext context;

  ShowMovieBloc(this.context, {required this.repository})
      : super(MoviesInitialState()) {}
}
