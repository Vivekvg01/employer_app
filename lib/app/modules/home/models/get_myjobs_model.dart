import 'job_model.dart';

class MyJobs {
  MyJobs(
    this.jobModel,
  );

  List<JobModel>? jobModel;

  factory MyJobs.fromJson(List<dynamic> parsedJson) {
    List<JobModel> joblist = <JobModel>[];
    joblist = parsedJson.map((i) => JobModel.fromJson(i)).toList();
    return MyJobs(joblist);
  }
}
