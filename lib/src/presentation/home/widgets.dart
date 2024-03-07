import 'package:blablagithub/src/domain/home/entities/search_result_entity.dart';
import 'package:flutter/material.dart';

class RepositoryCard extends StatelessWidget {
  final SearchResultItem searchResultItem;

  const RepositoryCard({super.key, required this.searchResultItem});

  @override
  Widget build(BuildContext context) {
    final RepositoryEntity repository = searchResultItem.repository;
    final OwnerEntity owner = repository.owner;
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: owner.avatarUrl != null
            ? CircleAvatar(
                backgroundImage: NetworkImage(
                owner.avatarUrl!,
              ))
            : null,
        title: Text(searchResultItem.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(repository.fullName ?? ''),
            const SizedBox(height: 4),
            Text(owner.login ?? ''),
            const SizedBox(height: 4),
            Text("Score: ${searchResultItem.score.toStringAsFixed(2)}"),
          ],
        ),
        onTap: () {
          // Handle tap event
        },
      ),
    );
  }
}
