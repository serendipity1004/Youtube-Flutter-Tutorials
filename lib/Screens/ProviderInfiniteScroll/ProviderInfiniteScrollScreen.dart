import 'package:codefactory_youtube_flutter_tutorial/Layouts/DefaultAppbarLayout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AjaxProvider.dart';

class ProviderInfiniteScrollScreen extends StatefulWidget {
  @override
  _ProviderInfiniteScrollScreenState createState() =>
      _ProviderInfiniteScrollScreenState();
}

class _ProviderInfiniteScrollScreenState
    extends State<ProviderInfiniteScrollScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.microtask(() {
      Provider.of<AjaxProvider>(context, listen: false).fetchItems();
    });
  }

  _renderListView() {
    final provider = Provider.of<AjaxProvider>(context);

    final cache = provider.cache;

    final loading = provider.loading;

    //로딩중이면서 캐시에 아무것도 없음
    if(loading && cache.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    //로딩중이 아닌데 캐시에 아무것도 없음
    //아무것도 가져올 아이템이 없을때
    if(!loading && cache.length == 0) {
      return Center(
        child: Text('아이템이 없습니다.'),
      );
    }

    return ListView.builder(
      itemCount: cache.length + 1,
      itemBuilder: (context, index) {
        if (index < cache.length) {
          return ListTile(
            title: Text(
              cache[index].toString(),
            ),
          );
        }

        if(!provider.loading && provider.hasMore){
          Future.microtask(() {
            provider.fetchItems(nextId: index);
          });
        }

        if(provider.hasMore) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return Center(
            child: Text('더이상 아이템이 없습니다.'),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAppbarLayout(
      title: 'Provider Infinite Scroll',
      child: _renderListView(),
    );
  }
}
