import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../note.dart';
import '../home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  HomeBloc(this._homeRepository) : super(HomeInitial()) {
    on<onInitialize>(_onInitialize);
    on<onShowButtonTap>(_onShowButtonTap);
    on<onTitleLongPress>(_onTitleLongPress);
    on<onDeleteTap>(_onDeleteTap);
    on<onEditTap>(_onEditTap);
    on<onAddTap>(_onAddTap);
    on<onViewTap>(_onViewTap);
    on<onEditSubmitTap>(_onEditSubmitTap);
  }

  Future<FutureOr<void>> _onInitialize(onInitialize event, Emitter<HomeState> emit) async {
    await emit.forEach(_homeRepository.getNoteStream(), onData: (QuerySnapshot data) {
      final noteList = data.docs.map((e) => Note.fromJson(e.data() as Map<String, dynamic>)).toList();
      if (state is HomeLoaded) {
        return (state as HomeLoaded).copyWith(noteList: noteList);
      } else {
        return HomeLoaded(noteList: noteList);
      }
    }, onError: (e, s) {
      return HomeInitial();
    });
  }

  FutureOr<void> _onShowButtonTap(onShowButtonTap event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final homeLoadedState = state as HomeLoaded;
      emit(homeLoadedState.copyWith(showLess: !homeLoadedState.showLess));
    }
  }

  FutureOr<void> _onTitleLongPress(onTitleLongPress event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final homeLoadedState = state as HomeLoaded;
      emit(homeLoadedState.copyWith(showEditToolIndex: event.index == homeLoadedState.showEditToolIndex ? -1 : event.index));
    }
  }

  FutureOr<void> _onDeleteTap(onDeleteTap event, Emitter<HomeState> emit) {
    emit((state as HomeLoaded).copyWith(showEditToolIndex: -1));
    _homeRepository.deleteNote(event.note.id);
  }

  FutureOr<void> _onEditSubmitTap(onEditSubmitTap event, Emitter<HomeState> emit) {
    event.note.id == null ? _homeRepository.addNote(event.note) : _homeRepository.updateNote(event.note);
  }

  FutureOr<void> _onEditTap(onEditTap event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final homeLoadedState = state as HomeLoaded;
      emit(homeLoadedState.copyWith(editState: EditScreenMode.editMode));
    }
  }

  FutureOr<void> _onAddTap(onAddTap event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final homeLoadedState = state as HomeLoaded;
      emit(homeLoadedState.copyWith(editState: EditScreenMode.addMode));
    }
  }

  FutureOr<void> _onViewTap(onViewTap event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final homeLoadedState = state as HomeLoaded;
      emit(homeLoadedState.copyWith(editState: EditScreenMode.viewMode));
    }
  }
}
