import '../../domain/entities/wallet_summary.dart';

class WalletSummaryModel extends WalletSummary {
  const WalletSummaryModel({
    required super.wallet,
    required super.transactions,
  });

  factory WalletSummaryModel.fromMap(Map<String, dynamic> map) {
    final walletMap = (map['wallet'] as Map<String, dynamic>?) ?? map;
    final transactionsRaw = (map['transactions'] as List<dynamic>?) ?? const [];
    return WalletSummaryModel(
      wallet: Wallet(
        id: walletMap['id']?.toString() ?? '',
        balance: (walletMap['balance'] as num?)?.toDouble() ?? 0,
        currency: walletMap['currency']?.toString() ?? 'LYD',
      ),
      transactions: transactionsRaw
          .whereType<Map<String, dynamic>>()
          .map(WalletTransactionModel.fromMap)
          .toList(),
    );
  }
}

class WalletTransactionModel extends WalletTransaction {
  const WalletTransactionModel({
    required super.id,
    required super.amount,
    required super.type,
    required super.createdAt,
    super.description,
  });

  factory WalletTransactionModel.fromMap(Map<String, dynamic> map) {
    return WalletTransactionModel(
      id: map['id']?.toString() ?? '',
      amount: (map['amount'] as num?)?.toDouble() ?? 0,
      type: map['type']?.toString() ?? 'unknown',
      createdAt: DateTime.tryParse(map['created_at']?.toString() ?? '') ?? DateTime.now(),
      description: map['description']?.toString(),
    );
  }
}



