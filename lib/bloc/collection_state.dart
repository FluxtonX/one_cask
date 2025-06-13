part of 'collection_bloc.dart';

abstract class CollectionState {}

class CollectionInitial extends CollectionState {}

class CollectionLoading extends CollectionState {}

class CollectionSuccess extends CollectionState {
  final List<Bottle> bottles;

  CollectionSuccess({required this.bottles});
}

class CollectionFailure extends CollectionState {
  final String error;

  CollectionFailure(this.error);
}
