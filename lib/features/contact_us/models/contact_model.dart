import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'contact_model.g.dart';

@JsonSerializable()
class ContactModel extends Equatable {
  final int id;
  final int? type;
  final String? value;
  final String? image;

  const ContactModel(
      {required this.id,
      required this.type,
      required this.value,
      required this.image});

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  @override
  List<Object?> get props => [id];
}
