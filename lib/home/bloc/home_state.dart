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
  final int editState;

  const HomeLoaded({required this.noteList, this.showLess = false, this.showEditToolIndex = -1, this.editState = -1});

  @override
  List<Object?> get props => [noteList, showLess, showEditToolIndex, editState];

  HomeLoaded copyWith({List<Note>? noteList, bool? showLess, int? showEditToolIndex, int? editState}) {
    return HomeLoaded(
        noteList: noteList ?? this.noteList,
        showLess: showLess ?? this.showLess,
        showEditToolIndex: showEditToolIndex ?? this.showEditToolIndex,
        editState: editState ?? this.editState);
  }
}

class EditScreenMode {
  static const int editMode = 0;
  static const int addMode = 1;
  static const int viewMode = 2;
}
