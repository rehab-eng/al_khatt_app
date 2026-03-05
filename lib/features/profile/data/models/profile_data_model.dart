import '../../domain/entities/profile_data.dart';

class ProfileDataModel extends ProfileData {
  const ProfileDataModel({
    required super.id,
    required super.phone,
    required super.fullName,
    required super.role,
    required super.dateJoined,
    required super.walletBalance,
    required super.walletCurrency,
    required super.tripsCount,
    super.contractorProfile,
    super.agentProfile,
    super.driverProfile,
    super.primaryTruckPlate,
    super.vehicleType,
  });

  factory ProfileDataModel.fromMap(Map<String, dynamic> map) {
    return ProfileDataModel(
      id: map['id']?.toString() ?? '',
      phone: map['phone']?.toString() ?? '',
      fullName: map['full_name']?.toString() ?? '',
      role: map['role']?.toString() ?? '',
      dateJoined: DateTime.tryParse(map['date_joined']?.toString() ?? '') ?? DateTime.now(),
      walletBalance: (map['wallet_balance'] as num?)?.toDouble() ?? 0,
      walletCurrency: map['wallet_currency']?.toString() ?? 'LYD',
      tripsCount: (map['trips_count'] as num?)?.toInt() ?? 0,
      contractorProfile: map['contractor_profile'] is Map<String, dynamic>
          ? ContractorProfileDataModel.fromMap(map['contractor_profile'] as Map<String, dynamic>)
          : null,
      agentProfile: map['agent_profile'] is Map<String, dynamic>
          ? AgentProfileDataModel.fromMap(map['agent_profile'] as Map<String, dynamic>)
          : null,
      driverProfile: map['driver_profile'] is Map<String, dynamic>
          ? DriverProfileDataModel.fromMap(map['driver_profile'] as Map<String, dynamic>)
          : null,
      primaryTruckPlate: map['primary_truck_plate']?.toString(),
      vehicleType: map['vehicle_type']?.toString(),
    );
  }
}

class ContractorProfileDataModel extends ContractorProfileData {
  const ContractorProfileDataModel({
    required super.companyName,
    required super.licenseNumber,
    required super.licenseStatus,
  });

  factory ContractorProfileDataModel.fromMap(Map<String, dynamic> map) {
    return ContractorProfileDataModel(
      companyName: map['company_name']?.toString() ?? '',
      licenseNumber: map['commercial_license_number']?.toString() ?? '',
      licenseStatus: map['license_status']?.toString() ?? 'pending',
    );
  }
}

class AgentProfileDataModel extends AgentProfileData {
  const AgentProfileDataModel({
    required super.companyName,
    required super.licenseNumber,
    required super.licenseStatus,
  });

  factory AgentProfileDataModel.fromMap(Map<String, dynamic> map) {
    return AgentProfileDataModel(
      companyName: map['company_name']?.toString() ?? '',
      licenseNumber: map['commercial_license_number']?.toString() ?? '',
      licenseStatus: map['license_status']?.toString() ?? 'pending',
    );
  }
}

class DriverProfileDataModel extends DriverProfileData {
  const DriverProfileDataModel({
    required super.licenseNumber,
    required super.licenseStatus,
  });

  factory DriverProfileDataModel.fromMap(Map<String, dynamic> map) {
    return DriverProfileDataModel(
      licenseNumber: map['license_number']?.toString() ?? '',
      licenseStatus: map['license_status']?.toString() ?? 'pending',
    );
  }
}
