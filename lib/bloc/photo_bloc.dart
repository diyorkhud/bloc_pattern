import 'package:bloc2_pattern/bloc/photo_event.dart';
import 'package:bloc2_pattern/bloc/photo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/http_service.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(PhotoInitialState()) {
    on<LoadPhotosEvent>(_onLoadPhotos);
    // on<DeletePostEvent>(_onDeletePost);
  }

  Future<void> _onLoadPhotos(
      LoadPhotosEvent event, Emitter<PhotoState> emit) async {
    emit(PhotoLoadingState());
    final response = await Network.GET(Network.API_PHOTOS_LIST, Network.paramsEmpty());
    if (response != null) {
      final photos = Network.parsePhotoList(response);
      emit(PhotoPostListState(photos));
    } else {
      emit(PhotoErrorState("Couldn't fetch posts"));
    }
  }

}