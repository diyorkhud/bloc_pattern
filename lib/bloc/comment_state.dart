import 'package:bloc2_pattern/model/comment_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CommentState extends Equatable {}

class CommentInitialState extends CommentState {
  @override
  List<Object?> get props => [];
}

class CommentLoadingState extends CommentState {
  @override
  List<Object?> get props => [];
}

class CommentErrorState extends CommentState {
  final String errorMessage;

  CommentErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class CommentPostListState extends CommentState{
  final List<Comment> comments;

  CommentPostListState(this.comments);

  @override
  List<Object> get props => [comments];
}

class CommentDeletePostState extends CommentState{
  @override
  List<Object> get props => [];
}