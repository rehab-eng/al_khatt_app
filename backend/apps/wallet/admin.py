from django.contrib import admin

from .models import LedgerAccount, JournalEntry, JournalLine, Wallet


class JournalLineInline(admin.TabularInline):
    model = JournalLine
    extra = 0


@admin.register(JournalEntry)
class JournalEntryAdmin(admin.ModelAdmin):
    list_display = ('id', 'memo', 'status', 'created_at', 'created_by')
    list_filter = ('status', 'created_at')
    search_fields = ('memo', 'reference_id')
    inlines = [JournalLineInline]


@admin.register(JournalLine)
class JournalLineAdmin(admin.ModelAdmin):
    list_display = ('entry', 'account', 'direction', 'amount')
    list_filter = ('direction',)
    search_fields = ('account__code', 'account__name')


@admin.register(LedgerAccount)
class LedgerAccountAdmin(admin.ModelAdmin):
    list_display = ('code', 'name', 'account_type', 'owner', 'balance', 'currency')
    list_filter = ('account_type', 'currency', 'scope')
    search_fields = ('code', 'name', 'owner__phone')


@admin.register(Wallet)
class WalletAdmin(admin.ModelAdmin):
    list_display = ('owner', 'balance', 'currency', 'created_at')
    search_fields = ('owner__phone',)



