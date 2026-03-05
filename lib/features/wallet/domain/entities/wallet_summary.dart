class WalletSummary {
  const WalletSummary({
    required this.wallet,
    required this.transactions,
  });

  final Wallet wallet;
  final List<WalletTransaction> transactions;
}

class Wallet {
  const Wallet({
    required this.id,
    required this.balance,
    required this.currency,
  });

  final String id;
  final double balance;
  final String currency;
}

class WalletTransaction {
  const WalletTransaction({
    required this.id,
    required this.amount,
    required this.type,
    required this.createdAt,
    this.description,
  });

  final String id;
  final double amount;
  final String type;
  final DateTime createdAt;
  final String? description;
}



