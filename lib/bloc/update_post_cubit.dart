import 'package:bloc_pattern/bloc/update_post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/post_model.dart';
import '../services/http_service.dart';

class UpdatePostCubit extends Cubit<UpdatePostState>  {
  UpdatePostCubit() : super(UpdatePostInit());
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  void apiPostUpdate(Post post) async{
    //post.userId = 1;
    print(post.toJson());
    emit(UpdatePostLoading());
    final response = await Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(
        Post(
            userId: post.userId,
            id: post.id,
            title: titleController.text,
            body: bodyController.text
        ),
    ));
    print(response);
    if (response != null) {
      emit(UpdatePostLoaded(isUpdated: true));
    } else {
      emit(UpdatePostError(error: "Couldn't update post"));
    }
  }
}