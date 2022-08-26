part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class onInitialize extends HomeEvent{
  @override
  List<Object?> get props => [];
}

class onShowButtonTap extends HomeEvent{
  @override
  List<Object?> get props => [];
}