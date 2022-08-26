part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class onInitialize extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class onShowButtonTap extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class onTitleLongPress extends HomeEvent {
  final int index;

  const onTitleLongPress(this.index);

  @override
  List<Object?> get props => [index];
}

class onDeleteTap extends HomeEvent {
  final Note note;

  const onDeleteTap(this.note);

  @override
  List<Object?> get props => [note];
}

class onAddNoteTap extends HomeEvent {
  const onAddNoteTap();

  @override
  List<Object?> get props => [];
}

class onEditNoteTap extends HomeEvent {
  const onEditNoteTap();

  @override
  List<Object?> get props => [];
}

class onViewNoteTap extends HomeEvent {
  const onViewNoteTap();

  @override
  List<Object?> get props => [];
}

class onEditSubmitTap extends HomeEvent {
  final Note note;

  const onEditSubmitTap(this.note);

  @override
  List<Object?> get props => [note];
}
