import 'package:flutter_bloc/flutter_bloc.dart';

// ===================== Bloc Section =====================

// Events
abstract class HomeEvent {}

class LoadHomeData extends HomeEvent {}

class SortEvents extends HomeEvent {}

class FilterPosts extends HomeEvent {}

// States
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<String> events;
  final List<String> posts;

  HomeLoaded({required this.events, required this.posts});
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

// Bloc
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeData>((event, emit) async {
      emit(HomeLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(HomeLoaded(
        events: ['Birthday Party', 'Wedding', 'Concert', 'Graduation', 'New Year Bash'],
        posts: ['Post 1', 'Post 2', 'Post 3', 'Post 4', 'Post 5'],
      ));
    });

    on<SortEvents>((event, emit) {
      if (state is HomeLoaded) {
        final currentState = state as HomeLoaded;
        final sortedEvents = List<String>.from(currentState.events)..sort();
        emit(HomeLoaded(events: sortedEvents, posts: currentState.posts));
      }
    });

    on<FilterPosts>((event, emit) {
      if (state is HomeLoaded) {
        final currentState = state as HomeLoaded;
        final filteredPosts =
            currentState.posts.where((post) => post.contains('1')).toList();
        emit(HomeLoaded(events: currentState.events, posts: filteredPosts));
      }
    });
  }
}