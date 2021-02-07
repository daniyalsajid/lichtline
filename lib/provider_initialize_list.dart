import 'package:lichtline/providers/on_boarding_provider.dart';
import 'package:provider/provider.dart';

final providersList = [
  ChangeNotifierProvider(
    create: (_) => OnBoardingProvider(),
  ),
];
