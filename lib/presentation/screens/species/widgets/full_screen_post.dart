import 'package:flutter/material.dart';

class FullScreenPost extends StatelessWidget {
  final String caption;
  final String postImageURL;

  const FullScreenPost({
    super.key,
    required this.caption,
    required this.postImageURL,
  });

  @override
  Widget build(BuildContext context) {
    print('🖼️ Intentando cargar imagen: $postImageURL');

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          postImageURL,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.broken_image, size: 80, color: Colors.grey[600]),
                  SizedBox(height: 8),
                  Text(
                    'Imagen no encontrada',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    postImageURL,
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.4),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        Positioned(
          left: 16,
          right: 16,
          bottom: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (caption.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    caption,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
