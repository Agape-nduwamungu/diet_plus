import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.purple[500],
      leading: SizedBox(),
      centerTitle: true,
      title: Text('Profile'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text(
            "Edit",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        )
      ],
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(
            image: "assets/Pimg.jpg",
            name: "Agape Nduwamungu",
            email: "agapenduwa433@gmail.com",
          ),
          SizedBox(
            height: 25,
          ),
          ProfileMenu(
            iconSrc: Icons.bookmark,
            title: "Saved Plans",
            press: () {},
          ),
          ProfileMenu(
            iconSrc: Icons.content_paste,
            title: "Reports",
            press: () {},
          ),
          ProfileMenu(
            iconSrc: Icons.settings,
            title: "Settings",
            press: () {},
          ),
          ProfileMenu(
            iconSrc: Icons.subdirectory_arrow_left,
            title: "Sign Out",
            press: () {},
          )
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    this.iconSrc,
    this.title,
    this.press,
  }) : super(key: key);

  final iconSrc, title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              Icon(
                iconSrc,
                size: 25,
                color: Colors.black,
              ),
              SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    Key key,
    this.name,
    this.email,
    this.image,
  }) : super(key: key);
  final String name, email, image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 150,
              color: Colors.purple[500],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 8,
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(image),
                      )),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(email)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
