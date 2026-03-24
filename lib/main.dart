import 'package:cnc_toolbox/core/app/app.dart';
import 'package:cnc_toolbox/core/app/bootstrap.dart';


/// The entry point of the application.
///
/// Instead of calling [runApp] directly, it utilizes a [bootstrap] wrapper
/// to ensure all essential services (logging, providers, local storage)
/// are initialized before the UI starts rendering.
void main() => bootstrap(() => const MyApp());
