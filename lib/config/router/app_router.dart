import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:green_birds/global/widgets/navigation/custom_curved_navigation_bar.dart';
import 'package:green_birds/presentation/screens/datailSpecie/detail_specie_screen.dart';
import 'package:green_birds/presentation/screens/detail/detail_research_screen.dart';
import 'package:green_birds/presentation/screens/home/home_screen.dart';
import 'package:green_birds/presentation/screens/sampling/sampling_research_point_screen.dart';
import 'package:green_birds/presentation/screens/samplingSpecies/sampling_species_screen.dart';
import 'package:green_birds/presentation/screens/species/species_catalog_screen.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  final int selectedIndex;

  const ScaffoldWithNavBar({
    super.key,
    required this.selectedIndex,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: child,
      bottomNavigationBar: CustomCurvedNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/species');
        break;
    }
  }
}

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        int selectedIndex = 0;
        final location = state.uri.path;
        if (location.startsWith('/home')) {
          selectedIndex = 0;
        } else if (location.startsWith('/species')) {
          selectedIndex = 1;
        }

        return ScaffoldWithNavBar(selectedIndex: selectedIndex, child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          path: '/species',
          name: 'species',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: SpeciesCatalogScreen()),
        ),
      ],
    ),
    GoRoute(
      path: '/research/:id',
      name: 'research-detail',
      builder: (context, state) {
        final researchId = state.pathParameters['id']!;
        return DetailResearchScreen(id: researchId);
      },
    ),
    GoRoute(
      path: '/research/:researchId/sample-point/:pointId',
      name: 'sample-point-detail',
      builder: (context, state) {
        final researchId = state.pathParameters['researchId']!;
        final pointId = state.pathParameters['pointId']!;
        return SamplingResearchPointScreen(
          researchId: researchId,
          pointId: pointId,
        );
      },
    ),
    GoRoute(
      path: '/sample/:sampleId',
      name: 'sample-detail',
      builder: (context, state) {
        final sampleId = state.pathParameters['sampleId']!;
        return SamplingSpeciesScreen(sampleId: sampleId);
      },
    ),
    GoRoute(
      path: '/species/:specieId',
      name: 'specie-detail',
      builder: (context, state) {
        final specieId = state.pathParameters['specieId']!;
        return DetailSpecieScreen(specieId: specieId);
      },
    ),
  ],
);
