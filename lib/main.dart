import 'package:flutter/material.dart';
import 'package:instagram/Store/homeData.dart';
import 'package:instagram/Store/profileData.dart';
import 'package:instagram/widgets/bottomBar.dart';
// 그냥 style 변수는 다른 style 변수가 생겨 겹칠 수도 있어서 as theme을 만든다
import 'constants/theme.dart' as theme;
import 'Pages/bodyPage.dart';
import 'widgets/appBar.dart';
import 'package:provider/provider.dart';

// 변수를 다른 파일에서 쓰기 싫을 때 : _변수 _함수명 _클래스명

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeData>(create: (context)=>HomeData()),
          ChangeNotifierProvider<ProfileData>(create: (context)=>ProfileData()),
        ],
        child: MaterialApp(
          theme: theme.style,
          home: MyApp(),
          debugShowCheckedModeBanner: false,
        ),
      )
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  var scrollController = ScrollController();

  void _changePage(int index){
    setState(()=>{
      _currentIndex = index
    });
  }

  @override
  void initState(){
    super.initState();
    context.read<HomeData>().getData();
  }
  @override
  void dispose(){
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: TopAppBar(),
        body: BodyPage(
          changePage : _changePage,
          pageController : _pageController,
          currentIndex : _currentIndex,
        ),
        bottomNavigationBar: BottomBar(currentIndex: _currentIndex, pageController: _pageController),
        extendBodyBehindAppBar: true,
      ),
    );
  }
}
