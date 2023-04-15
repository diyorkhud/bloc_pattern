import 'package:bloc2_pattern/bloc/update_event.dart';
import 'package:bloc2_pattern/bloc/update_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/post_model.dart';
import '../service/http_service.dart';


class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc() : super(UpdateInitialState()) {
    on<UpdatePostEvent>(_onUpdatePost);
  }

  Future<void> _onUpdatePost(
      UpdatePostEvent event, Emitter<UpdateState> emit) async {
    emit(UpdateLoadingState());
    final response = await Network.PUT(
        Network.API_UPDATE + event.post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      Post post = Network.parsePost(response);
      emit(UpdatedPostState(post));
    } else {
      emit(UpdateErrorState("Couldn't update post"));
    }
  }
}