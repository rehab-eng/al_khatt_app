from rest_framework import serializers

from .models import JournalEntry, JournalLine, LedgerAccount, Wallet


class LedgerAccountSerializer(serializers.ModelSerializer):
    balance = serializers.SerializerMethodField()

    class Meta:
        model = LedgerAccount
        fields = ['id', 'owner', 'scope', 'name', 'code', 'account_type', 'currency', 'balance']

    def get_balance(self, obj):
        return obj.balance


class JournalLineSerializer(serializers.ModelSerializer):
    class Meta:
        model = JournalLine
        fields = ['id', 'account', 'direction', 'amount']


class JournalEntrySerializer(serializers.ModelSerializer):
    lines = JournalLineSerializer(many=True, read_only=True)

    class Meta:
        model = JournalEntry
        fields = [
            'id',
            'memo',
            'reference_type',
            'reference_id',
            'status',
            'created_by',
            'created_at',
            'lines',
        ]


class WalletSerializer(serializers.ModelSerializer):
    balance = serializers.SerializerMethodField()

    class Meta:
        model = Wallet
        fields = ['id', 'owner', 'currency', 'created_at', 'balance']

    def get_balance(self, obj):
        return obj.balance


class WalletTransactionSerializer(serializers.ModelSerializer):
    type = serializers.CharField(source='direction')
    created_at = serializers.DateTimeField(source='entry.created_at')
    description = serializers.CharField(source='entry.memo', allow_blank=True)
    status = serializers.CharField(source='entry.status')

    class Meta:
        model = JournalLine
        fields = ['id', 'amount', 'type', 'created_at', 'description', 'status']


class WalletSummarySerializer(serializers.Serializer):
    wallet = WalletSerializer()
    transactions = WalletTransactionSerializer(many=True)


