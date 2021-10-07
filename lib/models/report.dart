import 'package:flutter/widgets.dart';
import 'package:pet_rescue/data/report_status.dart';

class Report {
  String location;
  String petType;
  int quantity;
  String petSize;
  String healCondition;
  String note;
  List<Image> images;
  ReportStatus reportStatus;
  bool emergencyCase;

  Report({
    required this.location,
    required this.petType,
    required this.quantity,
    required this.petSize,
    required this.healCondition,
    required this.images,
    this.note = "",
    this.reportStatus = ReportStatus.volunteerWaiting,
    this.emergencyCase = false,
  });
}
