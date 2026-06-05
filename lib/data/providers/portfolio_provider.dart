import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jessweb/data/models/portfolio_data.dart';

final portfolioProvider = Provider<PortfolioData>(
  (ref) => throw UnimplementedError(
    'portfolioProvider 必須在 ProviderScope.overrides 中覆寫',
  ),
);
