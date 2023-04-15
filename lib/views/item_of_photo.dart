import 'package:bloc2_pattern/bloc/photo_bloc.dart';
import 'package:bloc2_pattern/model/photo_model.dart';
import 'package:flutter/material.dart';

Widget itemOfPhoto(BuildContext context, PhotoBloc photoBloc, Photo photo) {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          photo.title!.toUpperCase(),
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Image.network(photo.url!, width: double.infinity, height: 100,),
        const SizedBox(
          height: 5,
        ),

      ],
    ),
  );
}