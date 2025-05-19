import 'package:equatable/equatable.dart';

abstract class JobsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class JobsInitial extends JobsState {}

class JobsLoading extends JobsState {}

class JobsLoaded extends JobsState {
  final List jobsData;

  JobsLoaded(this.jobsData);

  @override
  List<Object?> get props => [jobsData];
}

class Jobserror extends JobsState {
  final String message;

  Jobserror(this.message);

  @override
  List<Object?> get props => [message];
}
