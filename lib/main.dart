import 'package:flutter/material.dart';
import 'movie/list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '爱奇艺flutter版',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('电影列表'),
            centerTitle: true,
            actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('Jimmy'),
                  accountEmail: Text('123@qq.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.gitee.com/uploads/91/465191_vsdeveloper.png?1530762316'),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'http://www.liulongbin.top:3005/images/bg1.jpg'))),
                ),
                ListTile(title: Text("用户反馈"), trailing: Icon(Icons.feedback)),
                ListTile(title: Text("系统设置"), trailing: Icon(Icons.settings)),
                ListTile(title: Text("我要发布"), trailing: Icon(Icons.send)),
                Divider(),
                ListTile(title: Text("注销"), trailing: Icon(Icons.exit_to_app)),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(color: Colors.black),
            height: 50,
            child: TabBar(
              labelStyle: TextStyle(height: 0, fontSize: 10),
              tabs: [
                Tab(
                  icon: Icon(Icons.movie_filter),
                  text: '正在热映',
                ),
                Tab(
                  icon: Icon(Icons.movie_creation),
                  text: '即将上映',
                ),
                Tab(
                  icon: Icon(Icons.local_movies),
                  text: 'Top250',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MovieList(mt: 'in_theaters'),
              MovieList(mt: 'coming_soon'),
              MovieList(mt: 'top250')
            ],
          ),
        ));
  }
}
