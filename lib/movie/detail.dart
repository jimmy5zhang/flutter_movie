import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio = new Dio();

class MovieDetail extends StatefulWidget {
  MovieDetail({Key key, @required this.id, @required this.title})
      : super(key: key);

  final String id;

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MovieDetailState();
  }
}

class _MovieDetailState extends State<MovieDetail> {
  var detail;

  @override
  void initState() {
    super.initState();
    getMovieDetail();
  }

  @override
  Widget build(BuildContext context) {
    if (detail == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Text('电影正在加载中...'),
          alignment: Alignment.center,
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Container(
            padding: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 25),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  detail['images']['small'],
                  fit: BoxFit.cover,
                ),
                Text('电影名称：${detail['title']}'),
                Text('上映年份：${detail['year']}年'),
                Text('电影类型：${detail['genres'].join(',')}'),
                Text('简介：${detail['summary']}',
                    maxLines: 3, overflow: TextOverflow.ellipsis)
              ],
            ),
          )),
    );
  }

  getMovieDetail() async {
    var url =
        'http://www.liulongbin.top:3005/api/v2/movie/subject/${widget.id}';
    print('url:' + url);
    var response = await dio.get(url);
    var result = response.data;
    print('result:${result}');
    setState(() {
      detail = result;
    });
  }
}
