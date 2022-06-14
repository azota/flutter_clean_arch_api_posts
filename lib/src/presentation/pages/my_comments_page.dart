import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/domain/models/comment_model.dart';
import 'package:flutter_app/src/presentation/manager/remote_comment_bloc/remote_comment_bloc.dart';
import 'package:flutter_app/src/presentation/widgets/item_commet_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../injector.dart';
import 'network_service.dart';

class MyCommentsPage extends StatefulWidget {
  final int postId;
  final String postTitle;

  const MyCommentsPage(this.postId, this.postTitle, {Key? key})
      : super(key: key);

  @override
  _MyCommentsPageState createState() => _MyCommentsPageState();
}

class _MyCommentsPageState extends State<MyCommentsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => injector<RemoteCommentBloc>()
              ..add(GetRemoteComments(widget.postId)),
          ),
        ],
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(),
        ));
  }

  PreferredSizeWidget _buildAppBar(context) {
    return AppBar(
      title: const Text('Comments'),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<RemoteCommentBloc, RemoteCommentState>(
      builder: (context, state) {
        if (state is RemoteCommentLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RemoteCommentLoadingDone) {
          return _showListOfComments(context, state);
        } else if (state is RemoteCommentError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text('Error ${state.error}', textAlign: TextAlign.center),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<RemoteCommentBloc>(context)
                      .add(GetRemoteComments(widget.postId));
                },
                child: const Text('Try again'),
              )
            ])),
          );
        }
        return Container();
      },
    );
  }

  Widget _showListOfComments(
      BuildContext context, RemoteCommentLoadingDone state) {
    return RefreshIndicator(
        child: ListView.builder(
            padding: const EdgeInsets.all(4),
            itemCount: state.comments!.length,
            itemBuilder: (BuildContext context, int index) {
              CommentModel comment = state.comments![index];
              return ItemCommentWidget(
                  comment.name, comment.email, comment.body);
            }),
        onRefresh: () => _onRefresh(context));
  }

  Future<void> _onRefresh(BuildContext context) async {
    /* BlocProvider.of<RemoteCommentBloc>(context)
        .add(GetRemoteComments(widget.postId));    */

    /* log('dio -> ${GetIt.instance<Dio>().hashCode}');
        _test(1);
        _test(2);
        _test(3);
        _test(4);
        _test(5);
        _test(6);
        _test(7);
        _test(8);
        _test(9);
        _test(10); */

    GetIt.instance<RemoteCommentBloc>().add(const GetRemoteComments(1));
    GetIt.instance<RemoteCommentBloc>().add(const GetRemoteComments(2));
    GetIt.instance<RemoteCommentBloc>().add(const GetRemoteComments(3));
    GetIt.instance<RemoteCommentBloc>().add(const GetRemoteComments(4));
    GetIt.instance<RemoteCommentBloc>().add(const GetRemoteComments(5));
    GetIt.instance<RemoteCommentBloc>().add(const GetRemoteComments(6));
    GetIt.instance<RemoteCommentBloc>().add(const GetRemoteComments(7));
    GetIt.instance<RemoteCommentBloc>().add(const GetRemoteComments(8));
    GetIt.instance<RemoteCommentBloc>().add(const GetRemoteComments(9));
    GetIt.instance<RemoteCommentBloc>().add(const GetRemoteComments(10));

    // final response =  Dio().get('https://jsonplaceholder.typicode.com/posts');
    // log('dio: response -> $response');
    // final response2 =  Dio().get('https://jsonplaceholder.typicode.com/comments?postId=1');
    // log('dio: response2 -> $response2');
    // final response3 =  Dio().get('https://jsonplaceholder.typicode.com/posts');
    // //log('dio: response -> $response');
    // final response4 =  Dio().get('https://jsonplaceholder.typicode.com/comments?postId=2');
    // //log('dio: response -> $response');
    // final response5 =  Dio().get('https://jsonplaceholder.typicode.com/posts');
    // //log('dio: response -> $response');
    // final response6 =  Dio().get('https://jsonplaceholder.typicode.com/comments?postId=3');
    // //log('dio: response -> $response');
    // final response7 =  Dio().get('https://jsonplaceholder.typicode.com/posts');
    // //log('dio: response -> $response');
    // final response8 =  Dio().get('https://jsonplaceholder.typicode.com/comments?postId=4');
    // //log('dio: response -> $response');
  }

  // ignore: unused_element
  Future<void> _test(postId) async {
    //Instantiate a service and keep it in your DI container:
    final service = NetworkService(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        dioClient: GetIt.instance<Dio>());
    // Prepare a request:
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: '/comments?postId=$postId',
      data: const NetworkRequestBody.json(
          {'login': 'user_name', 'password': 'password'}),
    );
    // Execute a request and convert response to your model:
    final response = await service.execute(
      request,
      AccessTokenResponse
          .fromJson, // <- Function to convert API response to your model
    );
    // Handle possible outcomes:
    response.maybeWhen(ok: (authResponse) {
      // Save access token or proceed with other parts of your app
    }, badRequest: (info) {
      // Handle specific error
    }, orElse: () {
      // Handle generic error
    });
  }
}
