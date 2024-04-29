import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_kelompok6_kelas_a/globals.dart';
import 'package:uts_kelompok6_kelas_a/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text(
                'Quran App', 
                style: GoogleFonts.poppins(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 28),
              ),
              const SizedBox(
                height: 16,
              ),
              Text('Learn Quran and\nRecite once everyday',
              style: GoogleFonts.poppins(fontSize: 18, color: text),
              textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 48,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                Container(
                  height: 450, 
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0x006f2da8),),
                  child: Image.asset('assets/images/splash.png'),
                ),
                Positioned(
                  left: 0,
                  bottom: -23,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen()),);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                          decoration: BoxDecoration( borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft, 
                              end: Alignment.bottomRight,
                              stops: [
                                0,
                                .6
                                ], 
                              colors: [ Color(0xFF503885), Color(0xFF935AFF),],
                              )),
                        child: Text('Get Started', style: GoogleFonts.poppins(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),)),
                    ),
                  ),
                )
              ],
              )
            ]),
          ),
        ),
      ),
    );
  }
} 