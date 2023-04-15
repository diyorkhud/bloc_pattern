import 'package:bloc2_pattern/bloc/comment_bloc.dart';
import 'package:bloc2_pattern/bloc/photo_bloc.dart';
import 'package:bloc2_pattern/bloc/update_bloc.dart';
import 'package:bloc2_pattern/pages/comment_page.dart';
import 'package:bloc2_pattern/pages/photo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/post_model.dart';
import '../pages/create_page.dart';
import '../pages/update_page.dart';
import '../service/http_service.dart';
import 'create_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<LoadPostsEvent>(_onLoadPosts);
    on<DeletePostEvent>(_onDeletePost);
  }

  Future<void> _onLoadPosts(
      LoadPostsEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      final posts = Network.parsePostList(response);
      emit(HomePostListState(posts));
    } else {
      emit(HomeErrorState("Couldn't fetch posts"));
    }
  }

  Future<void> _onDeletePost(
      DeletePostEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final response = await Network.DEL(
        Network.API_DELETE + event.post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      emit(HomeDeletePostState());
    } else {
      emit(HomeErrorState("Couldn't delete posts"));
    }
  }

  void callCreatePage(BuildContext context) async {
    var results = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => CreateBloc(),
          child: const CreatePage(),
        )));
    if (results != null) {
      add(LoadPostsEvent());
    }
  }

  void callCommentPage(BuildContext context) async {
    var results = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => CommentBloc(),
          child: const CommentPage(),
        )));
    if (results != null) {
      add(LoadPostsEvent());
    }
  }

  void callPhotoPage(BuildContext context) async {
    var results = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => PhotoBloc(),
          child: const PhotoPage(),
        )));
    if (results != null) {
      add(LoadPostsEvent());
    }
  }



  void callUpdatePage(BuildContext context, Post post) async {
    var results = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => UpdateBloc(),
          child: UpdatePage(post: post),
        )));
    if (results != null) {
      add(LoadPostsEvent());
    }
  }
}