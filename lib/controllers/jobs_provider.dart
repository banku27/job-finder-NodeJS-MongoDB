import 'package:flutter/foundation.dart';
import 'package:job_finder/models/response/jobs/get_job.dart';
import 'package:job_finder/models/response/jobs/jobs_response.dart';
import 'package:job_finder/services/helpers/jobs_helper.dart';

class JobsNotifier extends ChangeNotifier {
  late Future<List<JobsResponse>> jobsList;
  late Future<JobsResponse> recentJobs;
  late Future<GetJobRes> job;

  getJobs() {
    jobsList = JobsHelper.getJobs();
  }

  getRecentJobs() {
    recentJobs = JobsHelper.getRecentJobs();
  }

  getJob(String jobId) {
    job = JobsHelper.getJob(jobId);
  }
}
