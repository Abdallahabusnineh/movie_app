import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/features/favorites/bloc/favorite_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavoriteRateContainer extends StatelessWidget {
  final Function(bool)? onTapFavorite;
  final void Function(double) onRatingUpdate;
  final int movieId;

  const FavoriteRateContainer({
    required this.onTapFavorite,
    required this.onRatingUpdate,
    required this.movieId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.black38,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///----Favorite Button----///
              // LikeButton(
              //   padding: const EdgeInsets.all(10),
              //   onTap: (isLiked) async {
              //     await onTapFavorite!(isFavorite);
              //     return !isFavorite;
              //   },
              // ),
              BlocBuilder<FavoriteBloc, FavoritesStateAbstract>(
                builder: (context, state) {
                  var isFavorite = context.read<FavoriteBloc>().isFavorite;
                  return IconButton(
                    padding: const EdgeInsets.all(10),
                    onPressed: () async {
                      await onTapFavorite!(isFavorite);
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  );
                },
              ),

              const SizedBox(width: 10),

              ///----Rate Button----///
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                unratedColor: Colors.amber.withAlpha(50),
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: onRatingUpdate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
