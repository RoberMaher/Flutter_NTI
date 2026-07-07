// fav/cubit/fav_state.dart
part of 'fav_cubit.dart';

@immutable
sealed class FavState {}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

final class FavSuccess extends FavState {}

final class FavFailure extends FavState {
  final String errorMessage;

  FavFailure({required this.errorMessage});
}
