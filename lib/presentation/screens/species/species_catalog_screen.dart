import 'package:flutter/material.dart';
import 'package:green_birds/presentation/providers/specie_posts_provider.dart';
import 'package:green_birds/presentation/screens/species/widgets/posts_scrollable_view.dart';
import 'package:provider/provider.dart';

class SpeciesCatalogScreen extends StatelessWidget {
  const SpeciesCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SpeciePostsProvider>();

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.green))
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
                ],
              ),
            )
          : PostsScrollableView(speciesPosts: provider.speciePosts),
    );
  }
}
