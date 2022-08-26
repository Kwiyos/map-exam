part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  final List<Note> noteList;

  const HomeLoaded({required this.noteList});

  @override
  List<Object?> get props => [noteList];

  HomeLoaded copyWith({
    List<Note>? noteList,
  }) {
    return HomeLoaded(
      noteList: noteList ?? this.noteList,
    );
  }
}
