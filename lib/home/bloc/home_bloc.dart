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
}
