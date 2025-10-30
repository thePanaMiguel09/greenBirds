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
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : PostsScrollableView(speciesPosts: provider.speciePosts),
    );
  }
}
