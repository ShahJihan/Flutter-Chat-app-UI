import 'package:chat_page/AppColorCodes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _isHidden = true;
  bool login = false;
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;
    return !isDark
        ? buildScaffold(context, pPrimaryColor, Colors.white)
        : buildScaffold(context, Colors.transparent, Colors.transparent);
  }

  Scaffold buildScaffold(BuildContext context, Color bgColor, Color contain) {
    return Scaffold(
        //backgroundColor:Theme.of(context).textTheme.bodyText1!.color,  -->edit this
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: pPrimaryColor,
          centerTitle: true,
          toolbarHeight: 140,
          title: Text(
            '...',
            style: TextStyle(
                fontSize: 40, letterSpacing: 6, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 160,
                decoration: BoxDecoration(
                      color: contain,  
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75.0),
                  topRight: Radius.circular(75.0),
                )),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 48.0, top: 48.0, bottom: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                fontFamily: 'Niconne-Regular'),
                          )
                        ],
                      ),
                    ),
                    TextFieldContainer(
                      child: TextField(
                        onChanged: (value) {},
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          hintText: 'Enter your Email',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    TextFieldContainer(
                      child: TextField(
                        obscureText: _isHidden,
                        onChanged: (value) {},
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Password",
                          icon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return ForgotPwd();
                          //     },
                          //   ),
                          // );
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: pMedColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: pMedColor.withOpacity(0.8),
                              shadowColor: pPrimaryColor,
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 25),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35.0))),
                          onPressed: () {},
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          login
                              ? "Don’t have an Account ? "
                              : "Already have an Account ? ",
                          // style: TextStyle(color: Colors.black),
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return LoginScreen();
                            //     },
                            //   ),
                            // );
                          },
                          child: Text(
                            login ? "Sign Up" : "Sign In",
                            style: TextStyle(
                              color: pPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    OrDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SocalIcon(
                          iconSrc: "assets/icons/facebook.svg",
                          press: () {},
                        ),
                        SocalIcon(
                          iconSrc: "assets/icons/twitter.svg",
                          press: () {},
                        ),
                        SocalIcon(
                          iconSrc: "assets/icons/google-plus.svg",
                          press: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: pSecondaryColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const SocalIcon({
    Key? key,
    required this.iconSrc,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: pPrimaryColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          color: Theme.of(context).textTheme.bodyText1!.color,
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.04),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Colors.grey[400],
        height: 1.5,
      ),
    );
  }
}
