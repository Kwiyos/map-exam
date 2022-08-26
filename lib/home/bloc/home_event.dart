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
