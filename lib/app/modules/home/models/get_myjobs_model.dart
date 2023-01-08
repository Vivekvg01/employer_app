import 'job_model.dart';

class MyJobs {
  MyJobs(
    this.jobModel,
  );

  List<JobModel>? jobModel;

  MyJobs.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson['result'] != null) {
      jobModel = <JobModel>[];
      parsedJson['result'].forEach((val) {
        jobModel!.add(JobModel.fromJson(val));
      });
    }
  }
}
