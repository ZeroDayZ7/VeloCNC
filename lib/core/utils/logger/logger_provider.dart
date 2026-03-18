import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_logger.dart';

part 'logger_provider.g.dart';

@Riverpod(keepAlive: true)
IAppLogger appLogger(Ref ref) {
  return AppLogger();
}
