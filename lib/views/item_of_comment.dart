import 'package:bloc2_pattern/bloc/comment_bloc.dart';
import 'package:flutter/material.dart';
import '../model/comment_model.dart';

Widget itemOfComment(BuildContext context, CommentBloc commentBloc, Comment comment) {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          comment.name!.toUpperCase(),
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          comment.email!,
          style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          comment.body!,
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    ),
  );
}