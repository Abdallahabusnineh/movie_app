import 'package:flutter/material.dart';

@immutable
sealed class ShowMovieStateAbstract {}

class MoviesInitialState extends ShowMovieStateAbstract {}

///----Delete Rating----///
class DeleteMovieRatingLoadingState extends ShowMovieStateAbstract {}

class DeleteMovieRatingSuccessState extends ShowMovieStateAbstract {}

class DeleteMovieRatingErrorState extends ShowMovieStateAbstract {
  final String message;
  DeleteMovieRatingErrorState({required this.message});
}

///----Add Rating----///
class AddMovieRatingLoadingState extends ShowMovieStateAbstract {}

class AddMovieRatingSuccessState extends ShowMovieStateAbstract {}

class AddMovieRatingErrorState extends ShowMovieStateAbstract {
  final String message;
  AddMovieRatingErrorState({required this.message});
}

///----User Rating----///
class GetUserRatingLoadingState extends ShowMovieStateAbstract {}

class GetUserRatingSuccessState extends ShowMovieStateAbstract {
  final double? rating;

  GetUserRatingSuccessState(this.rating);
}

class GetUserRatingErrorState extends ShowMovieStateAbstract {
  final String message;
  GetUserRatingErrorState({required this.message});
}
