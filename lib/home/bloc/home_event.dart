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

class onAddTap extends HomeEvent {
  const onAddTap();

  @override
  List<Object?> get props => [];
}

class onEditTap extends HomeEvent {
  const onEditTap();

  @override
  List<Object?> get props => [];
}

class onViewTap extends HomeEvent {
  const onViewTap();

  @override
  List<Object?> get props => [];
}

class onEditSubmitTap extends HomeEvent {
  final Note note;

  const onEditSubmitTap(this.note);

  @override
  List<Object?> get props => [note];
}
