import 'package:bloc2_pattern/model/comment_model.dart';
import 'package:bloc2_pattern/model/photo_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PhotoState extends Equatable {}

class PhotoInitialState extends PhotoState {
  @override
  List<Object?> get props => [];
}

class PhotoLoadingState extends PhotoState {
  @override
  List<Object?> get props => [];
}

class PhotoErrorState extends PhotoState {
  final String errorMessage;

  PhotoErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class PhotoPostListState extends PhotoState{
  final List<Photo> photos;

  PhotoPostListState(this.photos);

  @override
  List<Object> get props => [photos];
}

class PhotoDeletePostState extends PhotoState{
  @override
  List<Object> get props => [];
}