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
  final int showEditToolIndex;

  const HomeLoaded(
      {required this.noteList, this.showLess = false, this.showEditToolIndex = -1});

  @override
  List<Object?> get props => [noteList, showLess, showEditToolIndex];

  HomeLoaded copyWith({List<Note>? noteList, bool? showLess, int? showEditToolIndex, String? editStatus}) {
    return HomeLoaded(
        noteList: noteList ?? this.noteList,
        showLess: showLess ?? this.showLess,
        showEditToolIndex: showEditToolIndex ?? this.showEditToolIndex,);
  }
}
