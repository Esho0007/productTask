
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../responsive/desktop_Scaffold.dart';
import '../responsive/mobile_scaffold.dart';
import '../responsive/responsive_layout.dart';
import '../responsive/tablet_scaffold.dart';
import 'landing_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const ResponsiveLayout(
              mobileScalffold: MobileScaffold(),
              tabletScalffold: TabletScaffold(),
              desktopScalffold: DesktopScaffold(),
            );
          } else {
            return const LandingScreen();
          }
        },
      ),
    );
  }
}
