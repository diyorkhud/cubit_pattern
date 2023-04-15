import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/update_post_cubit.dart';
import '../model/post_model.dart';

Widget viewOfUpdate(
    bool isLoading,
    BuildContext context,
    Post post,
    TextEditingController titleController,
    TextEditingController bodyController) {
  return Stack(
    children: [
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),
              // #title
              Container(
                height: 70,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green, width: 3),
                  color: Colors.white,
                ),
                child: TextField(
                  maxLines: 50,
                  controller: titleController,
                  style: const TextStyle(color:Colors.black,fontSize: 20),
                  decoration: const InputDecoration(
                    hintText: 'title',
                    hintStyle: TextStyle(fontStyle: FontStyle.italic),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              const SizedBox(height: 10,),
              // #content
              Container(
                height: 200,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green, width: 3),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: bodyController,
                  style: const TextStyle(color:Colors.black,fontSize: 18),
                  maxLines: 200,
                  decoration: const InputDecoration(
                    hintText: 'body',
                    hintStyle: TextStyle(fontStyle: FontStyle.italic),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.teal, width: 5),
                ),
                child: MaterialButton(
                  onPressed: (){
                    BlocProvider.of<UpdatePostCubit>(context).apiPostUpdate(post);
                    },
                  color: Colors.green,
                  minWidth: double.infinity,
                  height: 45,
                  child: const Text("Update post",style: TextStyle(color: Colors.white,fontSize: 18),),
                ),
              ),
            ],
          ),
        ),
      ),

     isLoading ? const Center(child: CircularProgressIndicator(),) : const SizedBox.shrink(),
    ],
  );
}