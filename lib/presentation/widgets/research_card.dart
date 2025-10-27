// presentation/widgets/research_card.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:green_birds/domain/entities/research.dart';
import 'package:green_birds/config/helpers/format_date.dart';

class ResearchCard extends StatelessWidget {
  final Research research;
  final String researchId;

  const ResearchCard({
    super.key,
    required this.research,
    required this.researchId,
  });

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF26AD71);

    return GestureDetector(
      onTap: () {
        context.push('/research/$researchId');
      },
      child: Container(
        width: 300,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        research.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      label: Text(
                        research.status,
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: research.status == "Ejecución"
                          ? color
                          : Colors.red,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: Text(
                    research.description != null
                        ? research.description!
                        : "Sin descripción",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 12),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month_outlined, color: color),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            research.startDate != null &&
                                    research.endDate != null
                                ? "${FormatDate.getFormatedDate(research.startDate!)}-${FormatDate.getFormatedDate(research.endDate!)}"
                                : 'Fecha desconocida',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.pin_drop_outlined, color: color),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            research.locality != null
                                ? '${research.locality!.city}-${research.locality!.state}'
                                : 'Ubicación desconocida',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
