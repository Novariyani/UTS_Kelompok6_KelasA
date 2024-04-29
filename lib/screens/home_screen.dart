import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_kelompok6_kelas_a/globals.dart';
import 'package:uts_kelompok6_kelas_a/tabs/surah_tab.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: _greeting(),
              ),
              SliverAppBar(
                pinned: true,
                elevation: 0,
                backgroundColor: background,
                automaticallyImplyLeading: false,
                shape: Border(
                  bottom: BorderSide(
                    width: 5,
                    color: const Color(0XFFAAAAAA).withOpacity(.1))),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0), 
                  child: _tab()),
              ),
            ],
            body: const TabBarView(
              children: [SurahTab(),]),
        ),
      ),
    ),
    );
  }

  TabBar _tab() {
    return TabBar(
      unselectedLabelColor: text, 
      labelColor: Colors.white,
      indicatorColor: primary,
      indicatorWeight: 3,
      tabs: [
      _tabItem(label: "Surah"),
    ]);
  }

  Tab _tabItem({required String label}) {
    return Tab(
      child: Text(label, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600,),),
       );
  }

  Column _greeting() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Assalamualaikum', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: text),
        ),
        const SizedBox(
          height: 4,
        ),
            Text('Lets Read Quran Today', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        const SizedBox(
          height: 24,
        ),
        _lastRead()
        ],
        );
  }

  Stack _lastRead() {
    return Stack(
        children: [
          Container(
            height: 136, 
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0,
                  .6
                ],
                colors: [
                 Color(0xFF503885), Color(0xFF935AFF),
              ]) ), 
              ),
          Positioned(
            bottom:-60,
            right: -15,
            child: Image.asset('assets/images/quran.png')),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/svgs/book.svg'),
                    const SizedBox(
                      width: 8,
                      ),
                    Text('Last Read', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500)),
                  ],
                ),
              const SizedBox(
                height:20,
                ),
                Text('Al-Fatihah', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text('Ayat No: 1', style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
                ),
                ],
            ),
          )
        ],);
  }

  AppBar _appBar() => AppBar(
    backgroundColor: background,
    automaticallyImplyLeading: false,
    elevation: 0,
    title: Row(children: [
      IconButton(
        onPressed: (() => {} ), 
        icon: SvgPicture.asset('assets/svgs/menu-icon.svg')),
      const SizedBox(width: 24,),
      Text('Quran App', style: GoogleFonts.poppins(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const Spacer(),
      IconButton(
        onPressed: (() => {} ), 
        icon: SvgPicture.asset('assets/svgs/search-icon.svg')),
      ]),
  );

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: gray,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: [
    _bottomBarItem(icon: "assets/svgs/lamp-icon.svg", label: "Tips"),
    _bottomBarItem(icon: "assets/svgs/quran-icon.svg", label: "Quran"),
    _bottomBarItem(icon: "assets/svgs/bookmark-icon.svg", label: "Bookmark"),  
  ],
  );

  BottomNavigationBarItem _bottomBarItem({required String icon, required String label}) => 
  BottomNavigationBarItem(
    icon: SvgPicture.asset(
      icon, 
      color: text, 
  ), 
    activeIcon: SvgPicture.asset(
      icon,
      color: primary,
    ) ,
     label: label);

}
