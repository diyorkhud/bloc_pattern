import 'package:bloc2_pattern/bloc/comment_bloc.dart';
import 'package:bloc2_pattern/bloc/comment_state.dart';
import 'package:bloc2_pattern/model/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/comment_event.dart';
import '../views/item_of_comment.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {

  late CommentBloc commentBloc;

  @override
  void initState() {
    super.initState();
    commentBloc = BlocProvider.of<CommentBloc>(context);
    commentBloc.add(LoadCommentsEvent());
    commentBloc.stream.listen((state) {
      if (state is CommentDeletePostState) {
        commentBloc.add(LoadCommentsEvent());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Comments"),
        ),
        body: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) {
            if (state is CommentErrorState) {
              return viewOfError(state.errorMessage);
            }

            if (state is CommentPostListState) {
              var items = state.comments;
              return viewOfCommentList(items);
            }

            return viewOfLoading();
          },
        ),
        );
  }

  Widget viewOfError(String err) {
    return Center(
      child: Text("Error occurred $err"),
    );
  }

  Widget viewOfLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget viewOfCommentList(List<Comment> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (ctx, index) {
        Comment comment = items[index];
        return itemOfComment(ctx, commentBloc, comment);
      },
    );
  }

}
