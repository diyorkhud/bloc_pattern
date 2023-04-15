import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/http_service.dart';
import 'comment_event.dart';
import 'comment_state.dart';


class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentInitialState()) {
    on<LoadCommentsEvent>(_onLoadComments);
    // on<DeletePostEvent>(_onDeletePost);
  }

  Future<void> _onLoadComments(
      LoadCommentsEvent event, Emitter<CommentState> emit) async {
    emit(CommentLoadingState());
    final response = await Network.GET(Network.API_COMMENTS_LIST, Network.paramsEmpty());
    if (response != null) {
      final comments = Network.parseCommentList(response);
      emit(CommentPostListState(comments));
    } else {
      emit(CommentErrorState("Couldn't fetch posts"));
    }
  }

}