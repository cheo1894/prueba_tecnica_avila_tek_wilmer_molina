import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_avila_tek/cubit/jobs/jobs_state.dart';
import 'package:prueba_tecnica_avila_tek/data/datasource/user_sources.dart';

class JobsCubit extends Cubit<JobsState> {
  JobsCubit() : super(JobsInitial());

  Future<void> getJobsData() async {
    emit(JobsLoading());

    var jobsData = await UserSources().getJobs();
    // print(jobsData);

    emit(JobsLoaded(jobsData));
  }
}
