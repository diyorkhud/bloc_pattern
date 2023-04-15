import 'package:bloc2_pattern/model/photo_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PhotoEvent extends Equatable {
  const PhotoEvent();
}

class LoadPhotosEvent extends PhotoEvent {
  @override
  List<Object> get props => [];
}

class DeletePhotoEvent extends PhotoEvent {
  final Photo photo;

  const DeletePhotoEvent({required this.photo});

  @override
  List<Object> get props => [photo];
}