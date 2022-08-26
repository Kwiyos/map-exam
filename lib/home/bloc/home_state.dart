part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  final List<Note> noteList;
  final bool showLess;

  const HomeLoaded({required this.noteList, this.showLess = false});

  @override
  List<Object?> get props => [noteList, showLess];

  HomeLoaded copyWith({
    List<Note>? noteList,
    bool? showLess,
  }) {
    return HomeLoaded(
      noteList: noteList ?? this.noteList,
      showLess: showLess ?? this.showLess,
    );
  }
}
