import 'package:bloc2_pattern/model/comment_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CommentEvent extends Equatable {
  const CommentEvent();
}

class LoadCommentsEvent extends CommentEvent {
  @override
  List<Object> get props => [];
}

class DeleteCommentEvent extends CommentEvent {
  final Comment comment;

  const DeleteCommentEvent({required this.comment});

  @override
  List<Object> get props => [comment];
}