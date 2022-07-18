import 'dart:async';

import 'package:flutter/material.dart';
import '../../domain/models/ecommerce_model.dart';
import '../manager/ecommerce_bloc/ecommerce_bloc.dart';
import 'my_comments_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injector.dart';

class EcommercePage extends StatefulWidget {
  final String title;

  const EcommercePage(this.title, {Key? key}) : super(key: key);

  @override
  _EcommercePageState createState() => _EcommercePageState();
}

class _EcommercePageState extends State<EcommercePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              injector<EcommerceBloc>()..add(const GetEcommerceList()),
        ),
      ],
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(context) {
    return AppBar(
      title: Text(widget.title),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<EcommerceBloc, EcommerceState>(
      builder: (context, state) {
        if (state is EcommerceLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is EcommerceLoaded) {
          return _showListOfPosts(context, state.items!);
        } else if (state is EcommerceError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text('Error ${state.error}', textAlign: TextAlign.center),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<EcommerceBloc>(context)
                        .add(const GetEcommerceList());
                  },
                  child: const Text('Try again'),
                ),
              ]),
            ),
          );
        }

        return Container();
      },
    );
  }

  Widget _showListOfPosts(BuildContext context, List<EcommerceModel> posts) {
    return RefreshIndicator(
      child: ListView.builder(
        padding: const EdgeInsets.all(4),
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: const Icon(Icons.post_add, color: Colors.blue),
              title: Text(posts[index].title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyCommentsPage(
                      posts[index].postId,
                      posts[index].title,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      onRefresh: () => _onRefresh(context),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<EcommerceBloc>(context).add(const GetEcommerceList());
  }
}
