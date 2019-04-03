import 'package:flutter/material.dart';  //纸墨风格
import 'package:flutter/cupertino.dart';  //ios类风格
import 'cart_page.dart';
import 'category_page.dart';
import 'home_page.dart';
import 'member_page.dart';

class IndexPage extends StatefulWidget {
  final Widget child;
  
  IndexPage({Key key, this.child}) : super(key: key);

  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [  //定义底部栏
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.home
      ),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.search
      ),
      title: Text('分类')
    ),
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.shopping_cart
      ),
      title: Text('购物车')
    ),
    BottomNavigationBarItem(
      icon: Icon(
        
        CupertinoIcons.profile_circled
      ),
      title: Text('会员中心')
    )
  ];

  final List tabBodises = [   //定义页面列表
     HomePage(),
     CategoryPage(),
     CartPage(),
     MemberPage()

  ];

  int curentIndex = 0;  //定义索引当前数组下标
  var currentPage;

  @override
  void initState() {
    currentPage=tabBodises[curentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(      //放到底部
        type: BottomNavigationBarType.fixed,
        currentIndex: curentIndex,    //切换选中
        items: bottomTabs,
        onTap: (index){
            setState(() {
              curentIndex =index;
              currentPage=tabBodises[curentIndex];
            });
        },
      ),
      body: currentPage,
    );
  }
}