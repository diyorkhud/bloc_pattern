import 'package:bloc2_pattern/bloc/photo_bloc.dart';
import 'package:bloc2_pattern/model/photo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/photo_event.dart';
import '../bloc/photo_state.dart';
import '../views/item_of_photo.dart';
class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {

  late PhotoBloc photoBloc;

  @override
  void initState() {
    super.initState();
    photoBloc = BlocProvider.of<PhotoBloc>(context);
    photoBloc.add(LoadPhotosEvent());
    photoBloc.stream.listen((state) {
      if (state is PhotoDeletePostState) {
        photoBloc.add(LoadPhotosEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photos"),
      ),
      body: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          if (state is PhotoErrorState) {
            return viewOfError(state.errorMessage);
          }

          if (state is PhotoPostListState) {
            var items = state.photos;
            return viewOfPhotoList(items);
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

  Widget viewOfPhotoList(List<Photo> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (ctx, index) {
        Photo photo = items[index];
        return itemOfPhoto(ctx, photoBloc, photo);
      },
    );
  }

}
