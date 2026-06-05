import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jessweb/data/models/portfolio_data.dart';
import 'package:jessweb/data/repositories/portfolio_repository.dart';

/// 持有 portfolio 顯示資料,初始化時自動從 Firestore 載入。
///
/// 以 [AsyncNotifier] 暴露載入中 / 錯誤 / 完成狀態,
/// 由 UI 層(BotToast)統一顯示 loading indicator 與錯誤訊息。
class PortfolioNotifier extends AsyncNotifier<PortfolioData> {
  @override
  Future<PortfolioData> build() {
    // build 拋出的例外會自動轉成 AsyncError 狀態。
    return PortfolioRepository.load();
  }

  /// 重新從 Firestore 載入資料並更新 state。
  Future<void> refreshData() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(PortfolioRepository.load);
  }
}

final portfolioProvider =
    AsyncNotifierProvider<PortfolioNotifier, PortfolioData>(
        PortfolioNotifier.new);
