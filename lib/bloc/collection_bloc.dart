import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/data/repository/collection_repository.dart';
import 'package:one_cask/models/bottle.dart';
part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final CollectionRepository repository;

  CollectionBloc(this.repository) : super(CollectionInitial()) {
    on<CollectionFetched>(_onCollectionFetched);
  }

  void _onCollectionFetched(
    CollectionFetched event,
    Emitter<CollectionState> emit,
  ) async {
    emit(CollectionLoading());
    try {
      final bottles = await repository.getCollection();
      emit(CollectionSuccess(bottles: bottles));
    } catch (e) {
      emit(CollectionFailure(e.toString()));
    }
  }
}
