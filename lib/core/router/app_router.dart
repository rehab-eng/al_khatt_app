import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/domain/entities/app_user.dart';
import '../../features/auth/presentation/controllers/auth_controller.dart';
import '../../features/auth/presentation/pages/agent_info_page.dart';
import '../../features/auth/presentation/pages/contractor_info_page.dart';
import '../../features/auth/presentation/pages/create_password_page.dart';
import '../../features/auth/presentation/pages/driver_info_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/otp_page.dart';
import '../../features/auth/presentation/pages/role_selection_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/fleet_management/presentation/pages/driver_jobs_page.dart';
import '../../features/fleet_management/presentation/pages/vehicle_info_page.dart';
import '../../features/messages/presentation/pages/messages_page.dart';
import '../../features/orders/presentation/pages/contractor_materials_page.dart';
import '../../features/orders/presentation/pages/orders_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/tracking/presentation/pages/agent_ops_page.dart';
import '../../features/ui_gallery/presentation/pages/account_created_animated_page.dart';
import '../../features/ui_gallery/presentation/pages/ui_gallery_page.dart';
import '../../features/ui_gallery/presentation/screens/account_driver_ui_screen.dart';
import '../../features/ui_gallery/presentation/screens/agent_ui_screen.dart';
import '../../features/ui_gallery/presentation/screens/contractor_ui_screen.dart';
import '../../features/ui_gallery/presentation/screens/driver_ui_screen.dart';
import '../../features/ui_gallery/presentation/screens/home_driver_ui_screen.dart';
import '../../features/ui_gallery/presentation/screens/messages_driver_ui_screen.dart';
import '../../features/ui_gallery/presentation/screens/otp_driver_section_screen.dart';
import '../../features/ui_gallery/presentation/screens/password_driver_section_screen.dart';
import '../../features/ui_gallery/presentation/screens/password_section_screen.dart';
import '../../features/ui_gallery/presentation/screens/vehicle_1_ui_screen.dart';
import '../../features/ui_gallery/presentation/screens/vehicle_2_ui_screen.dart';
import '../../features/ui_gallery/presentation/screens/welcome_driver_ui_screen.dart';
import '../../features/wallet/presentation/pages/wallet_page.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const otp = '/otp';
  static const roleSelect = '/role';
  static const contractorInfo = '/onboarding/contractor';
  static const driverInfo = '/onboarding/driver';
  static const agentInfo = '/onboarding/agent';
  static const vehicleInfo = '/onboarding/vehicle';
  static const createPassword = '/onboarding/password';
  static const contractorHome = '/contractor';
  static const driverHome = '/driver';
  static const agentHome = '/agent';
  static const wallet = '/wallet';
  static const orders = '/orders';
  static const messages = '/messages';
  static const profile = '/profile';

  static const uiGallery = '/ui-gallery';
  static const uiWelcome = '/ui/welcome';
  static const uiHome = '/ui/home';
  static const uiMessages = '/ui/messages';
  static const uiVehicle1 = '/ui/vehicle-1';
  static const uiVehicle2 = '/ui/vehicle-2';
  static const uiPassword = '/ui/password';
  static const uiPasswordDriver = '/ui/password-driver';
  static const uiOtpDriver = '/ui/otp-driver';
  static const uiAgent = '/ui/agent';
  static const uiContractor = '/ui/contractor';
  static const uiDriver = '/ui/driver';
  static const uiAccountCreated = '/ui/account-created';
  static const uiAccountDriver = '/ui/account-driver';
}

final routerNotifierProvider = Provider<RouterNotifier>((ref) {
  return RouterNotifier(ref);
});

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider);
  return GoRouter(
    initialLocation: AppRoutes.uiGallery,
    refreshListenable: notifier,
    redirect: notifier.redirect,
    routes: [
      GoRoute(
        path: AppRoutes.uiGallery,
        builder: (context, state) => const UiGalleryPage(),
      ),
      GoRoute(
        path: AppRoutes.uiAccountDriver,
        builder: (context, state) => const AccountDriverUiScreen(),
      ),
      GoRoute(
        path: AppRoutes.uiWelcome,
        builder: (context, state) => const WelcomeDriverUiScreen(),
      ),
      GoRoute(
        path: AppRoutes.uiHome,
        builder: (context, state) => const HomeDriverUiScreen(),
      ),
      GoRoute(
        path: AppRoutes.uiMessages,
        builder: (context, state) => const MessagesDriverUiScreen(),
      ),
      GoRoute(
        path: AppRoutes.uiVehicle1,
        builder: (context, state) => const Vehicle1UiScreen(),
      ),
      GoRoute(
        path: AppRoutes.uiVehicle2,
        builder: (context, state) => const Vehicle2UiScreen(),
      ),
      GoRoute(
        path: AppRoutes.uiPassword,
        builder: (context, state) => const PasswordSectionScreen(),
      ),
      GoRoute(
        path: AppRoutes.uiPasswordDriver,
        builder: (context, state) => const PasswordDriverSectionScreen(),
      ),
      GoRoute(
        path: AppRoutes.uiOtpDriver,
        builder: (context, state) => const OtpDriverSectionScreen(),
      ),
      GoRoute(
        path: AppRoutes.uiAgent,
        builder: (context, state) => const AgentUiScreen(),
      ),
      GoRoute(
        path: AppRoutes.uiContractor,
        builder: (context, state) => const ContractorUiScreen(),
      ),
      GoRoute(
        path: AppRoutes.uiDriver,
        builder: (context, state) => const DriverUiScreen(),
      ),
      GoRoute(
        path: AppRoutes.uiAccountCreated,
        builder: (context, state) => const AccountCreatedAnimatedPage(),
      ),
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.otp,
        builder: (context, state) => const OtpPage(),
      ),
      GoRoute(
        path: AppRoutes.roleSelect,
        builder: (context, state) => const RoleSelectionPage(),
      ),
      GoRoute(
        path: AppRoutes.contractorInfo,
        builder: (context, state) => const ContractorInfoPage(),
      ),
      GoRoute(
        path: AppRoutes.driverInfo,
        builder: (context, state) => const DriverInfoPage(),
      ),
      GoRoute(
        path: AppRoutes.agentInfo,
        builder: (context, state) => const AgentInfoPage(),
      ),
      GoRoute(
        path: AppRoutes.vehicleInfo,
        builder: (context, state) => const VehicleInfoPage(),
      ),
      GoRoute(
        path: AppRoutes.createPassword,
        builder: (context, state) => const CreatePasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.contractorHome,
        builder: (context, state) => const ContractorMaterialsPage(),
      ),
      GoRoute(
        path: AppRoutes.driverHome,
        builder: (context, state) => const DriverJobsPage(),
      ),
      GoRoute(
        path: AppRoutes.agentHome,
        builder: (context, state) => const AgentOpsPage(),
      ),
      GoRoute(
        path: AppRoutes.wallet,
        builder: (context, state) => const WalletPage(),
      ),
      GoRoute(
        path: AppRoutes.orders,
        builder: (context, state) => const OrdersPage(),
      ),
      GoRoute(
        path: AppRoutes.messages,
        builder: (context, state) => const MessagesPage(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const ProfilePage(),
      ),
    ],
  );
});

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this.ref) {
    ref.listen<AuthState>(authControllerProvider, (_, _) => notifyListeners());
  }

  final Ref ref;

  String? redirect(BuildContext context, GoRouterState state) {
    final authState = ref.read(authControllerProvider);
    final location = state.matchedLocation;

    const devRoutes = {
      AppRoutes.uiGallery,
      AppRoutes.uiAccountDriver,
      AppRoutes.uiWelcome,
      AppRoutes.uiHome,
      AppRoutes.uiMessages,
      AppRoutes.uiVehicle1,
      AppRoutes.uiVehicle2,
      AppRoutes.uiPassword,
      AppRoutes.uiPasswordDriver,
      AppRoutes.uiOtpDriver,
      AppRoutes.uiAgent,
      AppRoutes.uiContractor,
      AppRoutes.uiDriver,
      AppRoutes.uiAccountCreated,
    };

    if (devRoutes.contains(location)) {
      return null;
    }

    const publicRoutes = {
      AppRoutes.splash,
      AppRoutes.login,
      AppRoutes.otp,
      AppRoutes.roleSelect,
      AppRoutes.contractorInfo,
      AppRoutes.driverInfo,
      AppRoutes.agentInfo,
      AppRoutes.vehicleInfo,
      AppRoutes.createPassword,
    };

    if (!authState.isAuthenticated) {
      if (!publicRoutes.contains(location)) {
        return AppRoutes.login;
      }
      return null;
    }

    final role = authState.user!.role;
    final roleHome = switch (role) {
      UserRole.contractor => AppRoutes.contractorHome,
      UserRole.driver => AppRoutes.driverHome,
      UserRole.agent => AppRoutes.agentHome,
    };

    if (publicRoutes.contains(location)) {
      return roleHome;
    }

    if (!location.startsWith(roleHome) &&
        location != AppRoutes.wallet &&
        location != AppRoutes.orders &&
        location != AppRoutes.messages &&
        location != AppRoutes.profile) {
      return roleHome;
    }

    return null;
  }
}
