import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
// import 'package:eezimed_deliveries/pages/Models/FormModel.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../../Models/FormModel.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostfetchingLoadingState());
    var client = http.Client();
    List<PostModelUi> posts = [];
    try {
      var response = await client.get(Uri.parse(
          "https://merakesports.com/eezimeds-store/wp-json/wc/v3/products?consumer_key=ck_fe9024ab8906407415ff290c489a4690d18d18cc&consumer_secret=cs_a2537c0c15f41d979a13d33bf5a6e7fadf93ef7c"));
      List result = jsonDecode(response.body);
      print(response.body);
      for (int i = 0; i < result.length; i++) {
        PostModelUi post =
            PostModelUi.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      print(posts);
      emit(PostFetchingSuccessfulState(posts: posts));
    } catch (e) {
      emit(PostfetchingErrorState());
      log(e.toString());
    }
  }
}
