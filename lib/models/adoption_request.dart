enum AdoptionStatus { pending, approved, rejected }

class AdoptionRequest {
  final String id;
  final String petId;
  final String petName;
  final String adoptersName;
  final String email;
  final String contact;
  final String address;
  final String reason;
  final String otherPets;
  final String petDetails;
  final String children;
  final String childrenAges;
  final String preferredContact;
  final String appliedOn;
  AdoptionStatus status;

  AdoptionRequest({
    required this.id,
    required this.petId,
    required this.petName,
    required this.adoptersName,
    required this.email,
    required this.contact,
    required this.address,
    required this.reason,
    required this.otherPets,
    required this.petDetails,
    required this.children,
    required this.childrenAges,
    required this.preferredContact,
    required this.appliedOn,
    this.status = AdoptionStatus.pending,
  });
}