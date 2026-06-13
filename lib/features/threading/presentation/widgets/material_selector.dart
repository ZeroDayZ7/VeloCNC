import 'package:cnc_toolbox/core/theme/app_design.dart';
import 'package:cnc_toolbox/features/threading/data/models/material_iso.dart';
import 'package:flutter/material.dart';

class MaterialSelector extends StatelessWidget {
  final List<IsoMaterialGroup> groups;
  final String? selectedGroupId;
  final Function(IsoMaterialGroup) onGroupSelected;

  const MaterialSelector({
    super.key,
    required this.groups,
    this.selectedGroupId,
    required this.onGroupSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Text(
            'GRUPA MATERIAŁOWA',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
        ),
        SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: groups.length,
            separatorBuilder: (context, index) => AppSpacings.gapS,
            itemBuilder: (context, index) {
              final group = groups[index];
              final isSelected = selectedGroupId == group.groupId;

              // Sprawdzanie jasności koloru dla kontrastu tekstu
              final bool isLightColor =
                  group.groupId == 'M' || group.groupId == 'N';

              return GestureDetector(
                onTap: () => onGroupSelected(group),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 80,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? group.color.withValues(alpha: 0.15)
                        : Theme.of(context).colorScheme.surface,
                    borderRadius: AppRadii.radiusM,
                    border: Border.all(
                      color: isSelected
                          ? group.color
                          : Colors.grey.withValues(alpha: 0.2),
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: group.color,
                          shape: BoxShape.circle,
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: group.color.withValues(alpha: 0.4),
                                    blurRadius: 8,
                                  ),
                                ]
                              : null,
                        ),
                        child: Text(
                          group.groupId,
                          style: TextStyle(
                            color: isLightColor ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        group.name,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
