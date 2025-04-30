import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel extends Equatable {
  final int id;
  final String? image;

  const BannerModel({required this.id, required this.image});

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);

  @override
  List<Object?> get props => [id];
}
