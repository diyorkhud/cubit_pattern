import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../bloc/list_post_cubit.dart';
import '../bloc/list_post_state.dart';
import '../model/post_model.dart';
import '../services/http_service.dart';
import '../views/item_of_post.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("10 Books to Read Before You Die"),
          centerTitle: true,
        ),
        body: BlocBuilder<ListPostCubit, ListPostState>(
          builder: (BuildContext context, ListPostState state) {
            if (state is ListPostError) {
              return viewPostError(state.error);
            }

            if (state is ListPostLoaded) {
              var items = state.posts!;
              return viewOfPostList(items);
            }

            return viewOfLoading();
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            BlocProvider.of<ListPostCubit>(context).callCreatePage(context);
          },
          child: const Icon(Icons.add),
        ));
  }

  Widget viewPostError(String err) {
    return Center(
      child: Text("Error occurred $err"),
    );
  }

  Widget viewOfLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget viewOfPostList(List<Post> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (ctx, index) {
        return itemOfPost(ctx, items[index]);
      },
    );
  }

}
