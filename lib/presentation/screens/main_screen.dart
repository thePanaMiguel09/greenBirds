import 'package:flutter/material.dart';
import 'package:green_birds/global/widgets/navigation/custom_curved_navigation_bar.dart';
import 'package:green_birds/presentation/screens/datailSpecie/detail_specie_screen.dart';
import 'package:green_birds/presentation/screens/detail/detail_research_screen.dart';
import 'package:green_birds/presentation/screens/home/home_screen.dart';
import 'package:green_birds/presentation/screens/sampling/sampling_research_point_screen.dart';
import 'package:green_birds/presentation/screens/samplingSpecies/sampling_species_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    DetailResearchScreen(),
    SamplingResearchPointScreen(),
    SamplingSpeciesScreen(),
    DetailSpecieScreen(),
  ];

  void _onTabSelected(int index) => {
    setState(() {
      _pageIndex = index;
    }),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_pageIndex],
      bottomNavigationBar: CustomCurvedNavigationBar(
        currentIndex: _pageIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}
