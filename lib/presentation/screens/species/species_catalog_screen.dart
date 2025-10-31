import 'package:flutter/material.dart';
import 'package:green_birds/presentation/providers/specie_posts_provider.dart';
import 'package:green_birds/presentation/screens/species/widgets/posts_scrollable_view.dart';
import 'package:provider/provider.dart';

class SpeciesCatalogScreen extends StatefulWidget {
  const SpeciesCatalogScreen({super.key});

  @override
  State<SpeciesCatalogScreen> createState() => _SpeciesCatalogScreenState();
}

class _SpeciesCatalogScreenState extends State<SpeciesCatalogScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SpeciePostsProvider>().loadSpeciePosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SpeciePostsProvider>();

    if (provider.isLoading) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Color(0xFF26AD71)),
              SizedBox(height: 5),
              Text(
                'Cargando posts...',
                style: TextStyle(color: Color(0xFF26AD71)),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator(color: Color(0xFF26AD71)))
          : provider.speciePosts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 80, color: Colors.grey[400]),
                  SizedBox(height: 16),
                  Text(
                    'No se encontraron posts',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<SpeciePostsProvider>().loadSpeciePosts();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF26AD71),
                    ),
                    child: Text(
                      'Reintentar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          : PostsScrollableView(speciesPosts: provider.speciePosts),
    );
  }
}
