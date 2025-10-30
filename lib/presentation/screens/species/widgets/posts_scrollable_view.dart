import 'package:flutter/material.dart';
import 'package:green_birds/domain/entities/specie_post.dart';
import 'package:green_birds/presentation/screens/species/widgets/full_screen_post.dart';

class PostsScrollableView extends StatelessWidget {
  final List<SpeciePost> speciesPosts;

  const PostsScrollableView({super.key, required this.speciesPosts});

  @override
  Widget build(BuildContext context) {
    // Validación para lista vacía
    if (speciesPosts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications_none, size: 80, color: Colors.grey[400]),
            SizedBox(height: 16),
            Text(
              'No hay posts disponibles',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Intenta recargar más tarde',
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: speciesPosts.length,
      itemBuilder: (context, index) {
        final speciePost = speciesPosts[index];
        return FullScreenPost(
          caption: speciePost.capition,
          postImageURL: speciePost.imageURL,
        );
      },
    );
  }
}
