part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final Map<String, dynamic>? data;

  HomeLoaded({required this.data});
}

final class HomeFailure extends HomeState {
  final String error;

  HomeFailure({required this.error});
}
