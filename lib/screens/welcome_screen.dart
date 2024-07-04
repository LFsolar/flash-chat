import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {

  static String id = 'welcome_screen';
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

// class act as a ticker for a single animation
class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller; // important to dispose b/c resource intensive
  // custom animation
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller= AnimationController(
      vsync: this, //specify what is going to act as the ticker
      duration: Duration(seconds: 1), // how long animation runs for
      // upperBound: 100,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);
    // bounces animation
    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
    controller.forward();
    controller.addListener(() {
      setState(() {  });
    });
  }

  @override
  void dispoae() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                // TyperAnimatedTextKit(
                //   // '${controller.value.toInt()}%',
                //   text: ['Flash Chat'],
                //   textStyle: TextStyle(
                //     color: Colors.black45,
                //     fontSize: 45.0,
                //     fontWeight: FontWeight.w900,
                //   ),
                // ),
                AnimatedTextKit(
                    // '${controller.value.toInt()}%',
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flash Chat',
                        textStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 16.0),
            //   child: Material(
            //     elevation: 5.0,
            //     color: Colors.lightBlueAccent,
            //     borderRadius: BorderRadius.circular(30.0),
            //     child: MaterialButton(
            //       onPressed: () {
            //         //Go to login screen.
            //         Navigator.pushNamed(context, LoginScreen.id);
            //       },
            //       minWidth: 200.0,
            //       height: 42.0,
            //       child: const Text(
            //         'Log In',
            //       ),
            //     ),
            //   ),
            // ),
            RoundedButton(Colors.lightBlueAccent, 'Log In', () {
             //Go to login screen.
            Navigator.pushNamed(context, LoginScreen.id);
          }),
            //
            RoundedButton(Colors.blueAccent, 'Register', () {
              //Go to registration screen.
              Navigator.pushNamed(context, RegistrationScreen.id);
            }),
          ],
        ),
      ),
    );
  }
}