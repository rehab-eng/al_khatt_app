class ProfileData {
  const ProfileData({
    required this.id,
    required this.phone,
    required this.fullName,
    required this.role,
    required this.dateJoined,
    required this.walletBalance,
    required this.walletCurrency,
    required this.tripsCount,
    this.contractorProfile,
    this.agentProfile,
    this.driverProfile,
    this.primaryTruckPlate,
    this.vehicleType,
  });

  final String id;
  final String phone;
  final String fullName;
  final String role;
  final DateTime dateJoined;
  final double walletBalance;
  final String walletCurrency;
  final int tripsCount;
  final ContractorProfileData? contractorProfile;
  final AgentProfileData? agentProfile;
  final DriverProfileData? driverProfile;
  final String? primaryTruckPlate;
  final String? vehicleType;
}

class ContractorProfileData {
  const ContractorProfileData({
    required this.companyName,
    required this.licenseNumber,
    required this.licenseStatus,
  });

  final String companyName;
  final String licenseNumber;
  final String licenseStatus;
}

class AgentProfileData {
  const AgentProfileData({
    required this.companyName,
    required this.licenseNumber,
    required this.licenseStatus,
  });

  final String companyName;
  final String licenseNumber;
  final String licenseStatus;
}

class DriverProfileData {
  const DriverProfileData({
    required this.licenseNumber,
    required this.licenseStatus,
  });

  final String licenseNumber;
  final String licenseStatus;
}
