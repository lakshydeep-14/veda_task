import 'package:veda_task/config/app_extensions.dart';

class PriorityModel {
  final int id;
  final String priorityName, image;

  PriorityModel(
      {required this.id, required this.priorityName, required this.image});
}

List<PriorityModel> priorityList = [
  PriorityModel(
      id: 1, image: AppImagePath.priority1, priorityName: "Plant Care"),
  PriorityModel(
      id: 2,
      image: AppImagePath.priority2,
      priorityName: "Plant Lover Community"),
  PriorityModel(
      id: 3, image: AppImagePath.priority3, priorityName: "Plant Marketplace"),
];
