import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';

@JsonSerializable()
class CourseApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? courseId;
  final String courseName;

  const CourseApiModel({
    this.courseId,
    required this.courseName,
  });

  // Empty constructor for default values
  const CourseApiModel.empty()
      : courseId = '',
        courseName = '';

  // Factory to create a model from JSON
  factory CourseApiModel.fromJson(Map<String, dynamic> json) {
    return CourseApiModel(
      courseId: json['_id'], // Ensure the key matches the API response
      courseName: json['courseName'],
    );
  }

  // Method to convert the model to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': courseId, // Ensure the key matches the expected API payload
      'courseName': courseName,
    };
  }

  // Converts this API model to a domain entity
  CourseEntity toEntity() => CourseEntity(
        courseId: courseId,
        courseName: courseName,
      );

  // Factory method to create an API model from a domain entity
  factory CourseApiModel.fromEntity(CourseEntity entity) {
    return CourseApiModel(
      courseId: entity.courseId,
      courseName: entity.courseName,
    );
  }

  // Converts a list of API models to a list of domain entities
  static List<CourseEntity> toEntityList(List<CourseApiModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  List<Object?> get props => [courseId, courseName];
}
