import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:diet_plus/models/mealItem.dart';
import 'package:diet_plus/screens/MealDetailPage.dart';
import 'package:diet_plus/screens/Packages.dart';
import 'package:diet_plus/screens/Profile.dart';
import 'package:diet_plus/models/GridOne.dart';
import 'package:diet_plus/models/GridTwo.dart';
import 'package:diet_plus/models/IngredientProgress.dart';
import 'package:diet_plus/models/PackageCard.dart';
import 'package:diet_plus/models/RadialProgress.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String title = "Title";
  PageController _pageController = PageController();
  List<Widget> _fragments = [
    Fragment3(),
    Fragment1(),
    Fragment2(),
    Fragment4(),
    Fragment5()
  ];
  int _currentIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(_currentIndex) {
    _pageController.jumpToPage(_currentIndex);
  }

  final List<int> _backstack = [0];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return customPop(context);
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: _fragments,
          onPageChanged: _onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          onTap: _onItemTapped,
          color: Color(0xFFFFFFFF),
          backgroundColor: Color(0xFFFF4081),
          buttonBackgroundColor: Color(0xFFFFFFFF),
          height: 50,
          items: <Widget>[
            Icon(Icons.home, size: 20, color: Color(0xFF000000)),
            Icon(Icons.calendar_today, size: 20, color: Color(0xFF000000)),
            Icon(Icons.local_drink, size: 20, color: Color(0xFF000000)),
            Icon(Icons.shopping_cart, size: 20, color: Color(0xFF000000)),
            Icon(Icons.card_giftcard, size: 20, color: Color(0xFF000000))
          ],
          animationDuration: Duration(milliseconds: 200),
          animationCurve: Curves.bounceInOut,
        ),
      ),
    );
  }

  void navigateTo(int index) {
    _backstack.add(index);
    setState(() {
      _currentIndex = index;
    });
    _setTitle('$index');
  }

  void navigateBack(int index) {
    setState(() {
      _currentIndex = index;
    });
    _setTitle('$index');
  }

  Future<bool> customPop(BuildContext context) {
    print("CustomPop is called");
    print("_backstack = $_backstack");
    if (_backstack.length > 1) {
      _backstack.removeAt(_backstack.length - 1);
      navigateBack(_backstack[_backstack.length - 1]);
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  _setTitle(String appBarTitle) {
    setState(() {
      title = appBarTitle;
    });
  }
}

class Fragment3 extends StatefulWidget {
  @override
  _Fragment3State createState() => _Fragment3State();
}

class _Fragment3State extends State<Fragment3> {
  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF4081),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: MediaQuery.of(context).size.height * 0.38,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(60),
              ),
              child: Container(
                color: Color(0xFFFFFFFF),
                padding:
                    EdgeInsets.only(top: 30, left: 32, right: 16, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Profile()));
                      },
                      child: ListTile(
                          title: Text(
                              "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              )),
                          subtitle: Text(
                            "Hello, Agape",
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                          trailing: ClipOval(
                            child: Image.asset('assets/Pimg.jpg'),
                          )),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: <Widget>[
                        RadialProgress(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.4,
                          progress: 0.7,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            IngredientProgress(
                              ingredient: "Carbs",
                              progress: 0.7,
                              progressColor: Colors.red,
                              leftAmount: 60,
                              width: MediaQuery.of(context).size.width * 0.0005,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            IngredientProgress(
                              ingredient: "Protein",
                              progress: 1,
                              progressColor: Colors.green,
                              leftAmount: 58,
                              width: MediaQuery.of(context).size.width * 0.0005,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            IngredientProgress(
                              ingredient: "Fat",
                              progress: 1.3,
                              progressColor: Colors.orange,
                              leftAmount: 35,
                              width: MediaQuery.of(context).size.width * 0.0005,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.39,
            left: 0,
            right: 0,
            child: Container(
              color: Color(0xFFFF4081),
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 8, left: 32, right: 16),
                    child: Text("MEALS FOR TODAY",
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                  ),
                  Expanded(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          for (int i = 0; i < meals.length; i++)
                            MealCard(meal: meals[i])
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                    child: Container(
                      color: Color(0xFFFF4081),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Fragment1 extends StatefulWidget {
  @override
  _Fragment1State createState() => _Fragment1State();
}

class _Fragment1State extends State<Fragment1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pinkAccent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: SizedBox(),
          elevation: 0,
          centerTitle: true,
          title: Text("Diet Calendar"),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
          ),
          width: 400,
          height: 700,
          child: GridOne(),
        ));
  }
}

class Fragment2 extends StatefulWidget {
  @override
  _Fragment2State createState() => _Fragment2State();
}

class _Fragment2State extends State<Fragment2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pinkAccent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: SizedBox(),
          elevation: 0,
          centerTitle: true,
          title: Text("Water Calender"),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
          ),
          width: 400,
          height: 700,
          child: GridOne(),
        ));
  }
}

class Fragment4 extends StatefulWidget {
  @override
  _Fragment4State createState() => _Fragment4State();
}

class _Fragment4State extends State<Fragment4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pinkAccent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: SizedBox(),
          elevation: 0,
          centerTitle: true,
          title: Text("Shopping"),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
          ),
          width: 400,
          height: 700,
          child: GridTwo(),
        ));
  }
}

class Fragment5 extends StatefulWidget {
  @override
  _Fragment5State createState() => _Fragment5State();
}

class _Fragment5State extends State<Fragment5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: SizedBox(),
        elevation: 0,
        centerTitle: true,
        title: Text("Diet Package plans"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: GridView.builder(
                itemCount: packageCards.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.65,
                ),
                itemBuilder: (context, index) => Packages(
                      packageCard: packageCards[index],
                    )),
          ))
        ],
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard({Key key, @required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MealDetailPage(
                    meal: meal,
                  )));
        },
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                  fit: FlexFit.tight,
                  child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      child: Image.asset(
                        meal.imagePath,
                        fit: BoxFit.fill,
                      ))),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        meal.mealTime,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.blueGrey),
                      ),
                      Text(meal.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.black)),
                      Text(meal.caloriesGained),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.black38,
                          ),
                          Text(meal.timeTaken),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
