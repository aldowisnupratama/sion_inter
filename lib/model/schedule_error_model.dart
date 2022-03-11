class ScheduleErrorModel {
  ScheduleErrorModel({
    required this.result,
    required this.message,
  });
  late final String result;
  late final String message;

  ScheduleErrorModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
  }
}
