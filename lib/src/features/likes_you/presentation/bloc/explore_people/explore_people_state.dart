part of 'explore_people_bloc.dart';

@immutable
abstract class ExplorePeopleState {}

class ExplorePeopleInitial extends ExplorePeopleState {}

class ExplorePeopleLoading extends ExplorePeopleState {}

class ExplorePeopplLoaded extends ExplorePeopleState {
  final List<User> result;
  ExplorePeopplLoaded({required this.result});
}
