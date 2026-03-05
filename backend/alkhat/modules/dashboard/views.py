from decimal import Decimal

from django.db.models import DecimalField, Sum
from django.db.models.functions import Coalesce
from django.shortcuts import redirect, render

from alkhat.modules.users.models import ApprovalStatus, User, UserRole
from alkhat.modules.users.services import set_user_approval
from alkhat.modules.wallet.models import Wallet, WalletTransaction


def login(request):
    return render(request, "dashboard/login.html")


def index(request):
    active_drivers = User.objects.filter(
        role=UserRole.DRIVER,
        is_active=True,
        approval_status=ApprovalStatus.APPROVED,
    ).count()
    pending_approvals = User.objects.filter(
        role__in=[UserRole.DRIVER, UserRole.AGENT],
        approval_status=ApprovalStatus.PENDING,
    ).count()
    escrow_balance = Wallet.objects.aggregate(
        total=Coalesce(
            Sum("escrow_balance"),
            Decimal("0"),
            output_field=DecimalField(max_digits=18, decimal_places=2),
        ),
    )["total"]
    context = {
        "active_page": "dashboard",
        "active_drivers": active_drivers,
        "pending_approvals": pending_approvals,
        "escrow_balance": escrow_balance,
    }
    return render(request, "dashboard/index.html", context)


def approvals(request):
    if request.method == "POST":
        user_id = request.POST.get("user_id")
        action = request.POST.get("action")
        if user_id and action in {"approve", "reject"}:
            user = User.objects.filter(
                id=user_id,
                approval_status=ApprovalStatus.PENDING,
            ).first()
            if user:
                status = (
                    ApprovalStatus.APPROVED
                    if action == "approve"
                    else ApprovalStatus.REJECTED
                )
                set_user_approval(user, status)
        return redirect("dashboard-approvals")

    pending_drivers = User.objects.filter(
        role=UserRole.DRIVER,
        approval_status=ApprovalStatus.PENDING,
    ).order_by("date_joined")
    pending_agents = User.objects.filter(
        role=UserRole.AGENT,
        approval_status=ApprovalStatus.PENDING,
    ).order_by("date_joined")
    context = {
        "active_page": "approvals",
        "pending_drivers": pending_drivers,
        "pending_agents": pending_agents,
    }
    return render(request, "dashboard/approvals.html", context)


def users(request):
    contractor_qs = User.objects.filter(
        role=UserRole.CONTRACTOR,
        approval_status=ApprovalStatus.APPROVED,
        is_active=True,
    )
    driver_qs = User.objects.filter(
        role=UserRole.DRIVER,
        approval_status=ApprovalStatus.APPROVED,
        is_active=True,
    )
    agent_qs = User.objects.filter(
        role=UserRole.AGENT,
        approval_status=ApprovalStatus.APPROVED,
        is_active=True,
    )
    contractors = contractor_qs.order_by("-date_joined")[:10]
    drivers = driver_qs.order_by("-date_joined")[:10]
    agents = agent_qs.order_by("-date_joined")[:10]

    context = {
        "active_page": "users",
        "contractors": contractors,
        "drivers": drivers,
        "agents": agents,
        "contractor_count": contractor_qs.count(),
        "driver_count": driver_qs.count(),
        "agent_count": agent_qs.count(),
    }
    return render(request, "dashboard/users.html", context)


def orders(request):
    context = {"active_page": "orders"}
    return render(request, "dashboard/orders.html", context)


def finance(request):
    # Temporary forced values to verify this is the active dashboard instance.
    wallet_count = 0
    total_users = 1
    available_total = Wallet.objects.aggregate(
        total=Coalesce(
            Sum("available_balance"),
            Decimal("0"),
            output_field=DecimalField(max_digits=18, decimal_places=2),
        ),
    )["total"]
    escrow_total = Wallet.objects.aggregate(
        total=Coalesce(
            Sum("escrow_balance"),
            Decimal("0"),
            output_field=DecimalField(max_digits=18, decimal_places=2),
        ),
    )["total"]
    tx_count = WalletTransaction.objects.count()
    recent_transactions = (
        WalletTransaction.objects.select_related("wallet", "wallet__owner")
        .order_by("-created_at")[:6]
    )
    context = {
        "active_page": "finance",
        "wallet_count": wallet_count,
        "total_users": total_users,
        "available_total": available_total,
        "escrow_total": escrow_total,
        "tx_count": tx_count,
        "recent_transactions": recent_transactions,
    }
    return render(request, "dashboard/finance.html", context)


def fleet(request):
    context = {"active_page": "fleet"}
    return render(request, "dashboard/fleet.html", context)


def settings(request):
    context = {"active_page": "settings"}
    return render(request, "dashboard/settings.html", context)


def quarries(request):
    quarries_seed = [
        {
            "id": "wasat_al_gharbi",
            "name": "الوسط الغربي",
            "materials": [
                {"key": "cement", "label": "أسمنت"},
                {"key": "gravel", "label": "زلطية"},
                {"key": "aggregate", "label": "حصى"},
            ],
        },
        {
            "id": "hashim_al_ali",
            "name": "الهشيم العالي",
            "materials": [
                {"key": "gravel", "label": "زلطية"},
                {"key": "aggregate", "label": "حصى"},
            ],
        },
        {
            "id": "munir_al_mashlukh",
            "name": "كسارة منير المشلوخ",
            "materials": [
                {"key": "cement", "label": "أسمنت"},
                {"key": "aggregate", "label": "حصى"},
            ],
        },
        {
            "id": "al_tahouna",
            "name": "الطاحونة",
            "materials": [
                {"key": "gravel", "label": "زلطية"},
                {"key": "aggregate", "label": "حصى"},
            ],
        },
        {
            "id": "al_rimal_al_muntaja",
            "name": "الرمال المنتجة",
            "materials": [
                {"key": "sand", "label": "رمل"},
                {"key": "gravel", "label": "زلطية"},
            ],
        },
        {
            "id": "al_hafra",
            "name": "الحفرة",
            "materials": [
                {"key": "aggregate", "label": "حصى"},
                {"key": "sand", "label": "رمل"},
            ],
        },
        {
            "id": "jarf_al_rabita",
            "name": "جرف الرابطة",
            "materials": [
                {"key": "gravel", "label": "زلطية"},
                {"key": "aggregate", "label": "حصى"},
            ],
        },
        {
            "id": "sin6",
            "name": "سين6",
            "materials": [
                {"key": "cement", "label": "أسمنت"},
                {"key": "aggregate", "label": "حصى"},
            ],
        },
        {
            "id": "wadi_al_hay",
            "name": "وادي الحي",
            "materials": [
                {"key": "sand", "label": "رمل"},
                {"key": "aggregate", "label": "حصى"},
            ],
        },
    ]

    statuses = request.session.get("quarry_statuses")
    if statuses is None:
        statuses = {item["id"]: True for item in quarries_seed}
        request.session["quarry_statuses"] = statuses

    material_statuses = request.session.get("quarry_material_statuses")
    if material_statuses is None:
        material_statuses = {}
        for quarry in quarries_seed:
            material_statuses[quarry["id"]] = {
                material["key"]: True for material in quarry["materials"]
            }
        request.session["quarry_material_statuses"] = material_statuses

    if request.method == "POST":
        quarry_id = request.POST.get("quarry_id")
        action = request.POST.get("action")
        if action == "toggle_quarry" and quarry_id in statuses:
            statuses[quarry_id] = not statuses[quarry_id]
            request.session["quarry_statuses"] = statuses
        elif action == "toggle_material" and quarry_id in material_statuses:
            material_key = request.POST.get("material_key")
            if material_key in material_statuses[quarry_id]:
                material_statuses[quarry_id][material_key] = not material_statuses[quarry_id][
                    material_key
                ]
                request.session["quarry_material_statuses"] = material_statuses
        return redirect("dashboard-quarries")

    for quarry in quarries_seed:
        quarry["is_active"] = statuses.get(quarry["id"], False)
        quarry_materials = []
        for material in quarry["materials"]:
            is_available = material_statuses.get(quarry["id"], {}).get(material["key"], False)
            quarry_materials.append(
                {
                    "key": material["key"],
                    "label": material["label"],
                    "is_available": is_available,
                }
            )
        quarry["materials"] = quarry_materials

    active_count = sum(1 for quarry in quarries_seed if quarry["is_active"])
    inactive_count = len(quarries_seed) - active_count

    deliveries = [
        {
            "origin": "الوسط الغربي",
            "destination": "الدائري الثالث",
            "material": "حصى",
            "driver": "مصطفى عمر",
            "driver_code": "#0111",
            "trailer": "0232",
            "phone": "0915016621",
            "status": "تم التفريغ",
        },
        {
            "origin": "الرمال المنتجة",
            "destination": "دائري معيتيقة",
            "material": "زلطية",
            "driver": "مصطفى عمر",
            "driver_code": "#0111",
            "trailer": "0232",
            "phone": "0915016621",
            "status": "قيد التفريغ",
        },
        {
            "origin": "الهشيم العالي",
            "destination": "طريق الشوط",
            "material": "أسمنت",
            "driver": "مصطفى عمر",
            "driver_code": "#0111",
            "trailer": "0232",
            "phone": "0915016621",
            "status": "بانتظار الوصول",
        },
    ]

    context = {
        "active_page": "quarries",
        "quarries": quarries_seed,
        "active_count": active_count,
        "inactive_count": inactive_count,
        "deliveries": deliveries,
    }
    return render(request, "dashboard/quarries.html", context)
