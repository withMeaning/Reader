import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_with_meaning/public/features/experience/data/repository/read_repository.dart';
import 'package:read_with_meaning/shared/domain/all_types_definition.dart';
import 'package:read_with_meaning/shared/domain/experience.dart';
import 'package:read_with_meaning/shared/domain/types/read.dart';
import 'package:uuid/uuid.dart';

addReadToDB(WidgetRef ref, String title, String mainContent, String link) {
  Read read = Read(
      base: Experience(
        id: const Uuid().v4(),
        content: title,
        createdAt: DateTime.now(),
        type: AllTypes.read,
      ),
      mainContent: mainContent,
      source: 'manual',
      link: link);

  ref.read(addReadProvider(read));
}
