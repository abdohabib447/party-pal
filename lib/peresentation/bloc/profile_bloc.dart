import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum HomeTab { timeline, reviews }

class HomeTabState extends Equatable {
  final HomeTab tab;

  const HomeTabState(this.tab);

  @override
  List<Object> get props => [tab];
}

abstract class HomeTabEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeTab extends HomeTabEvent {
  final HomeTab tab;
  ChangeTab(this.tab);
}

class HomeTabBloc extends Bloc<HomeTabEvent, HomeTabState> {
  HomeTabBloc() : super(const HomeTabState(HomeTab.timeline)) {
    on<ChangeTab>((event, emit) {
      emit(HomeTabState(event.tab));
    });
  }
}
