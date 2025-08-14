import 'package:flutter/foundation.dart';
import '../models/pet.dart';
import '../models/user.dart';
import '../models/adoption_request.dart';

class AppProvider with ChangeNotifier {
  List<Pet> _pets = [
    Pet(
      id: '1',
      name: 'Roxy',
      category: 'Dog',
      breed: 'Chihuahua',
      age: '2 years',
      gender: 'Male',
      weight: '1.5 kg',
      description: 'House dog',
      imageUrl: 'assets/images/roxy.jpg',
      addedOn: '29/7/2025',
      isAvailable: true,
    ),
  ];

  List<User> _users = [
    User(
      id: '1',
      email: 'Roy@gmail.com',
      role: 'User',
    ),
    User(
      id: '2',
      email: 'adopter1@gmail.com',
      role: 'User',
    ),
  ];

  List<AdoptionRequest> _adoptionRequests = [
    AdoptionRequest(
      id: '1',
      petId: '1',
      petName: 'Lee',
      adoptersName: 'Adopter1',
      email: 'adopter1@gmail.com',
      contact: '0114925920',
      address: '1234',
      reason: 'I love pets',
      otherPets: 'Yes',
      petDetails: 'playful',
      children: 'Yes',
      childrenAges: '5-8',
      preferredContact: 'Phone',
      appliedOn: '28/7/2025',
      status: AdoptionStatus.pending,
    ),
  ];

  User? _currentUser;
  String _searchQuery = '';
  String _selectedFilter = 'All';

  List<Pet> get pets => _pets;
  List<User> get users => _users;
  List<AdoptionRequest> get adoptionRequests => _adoptionRequests;
  User? get currentUser => _currentUser;
  String get searchQuery => _searchQuery;
  String get selectedFilter => _selectedFilter;

  // Dashboard statistics
  int get petListings => _pets.length;
  int get adoptionRequestsCount => _adoptionRequests.length;
  int get adoptedPetsCount => _pets.where((pet) => !pet.isAvailable).length;
  int get usersCount => _users.length;

  // Filtered pets for search and filter
  List<Pet> get filteredPets {
    List<Pet> filtered = _pets;
    
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((pet) => 
        pet.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
        pet.breed.toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList();
    }
    
    if (_selectedFilter != 'All') {
      filtered = filtered.where((pet) => pet.category == _selectedFilter).toList();
    }
    
    return filtered;
  }

  void setCurrentUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setFilter(String filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  void addPet(Pet pet) {
    _pets.add(pet);
    notifyListeners();
  }

  void updatePet(Pet pet) {
    int index = _pets.indexWhere((p) => p.id == pet.id);
    if (index != -1) {
      _pets[index] = pet;
      notifyListeners();
    }
  }

  void deletePet(String petId) {
    _pets.removeWhere((pet) => pet.id == petId);
    notifyListeners();
  }

  void deleteUser(String userId) {
    _users.removeWhere((user) => user.id == userId);
    notifyListeners();
  }

  void approveAdoptionRequest(String requestId) {
    int index = _adoptionRequests.indexWhere((request) => request.id == requestId);
    if (index != -1) {
      _adoptionRequests[index].status = AdoptionStatus.approved;
      // Mark pet as unavailable
      Pet? pet = _pets.firstWhere((p) => p.id == _adoptionRequests[index].petId);
      pet.isAvailable = false;
      notifyListeners();
    }
  }

  void rejectAdoptionRequest(String requestId) {
    int index = _adoptionRequests.indexWhere((request) => request.id == requestId);
    if (index != -1) {
      _adoptionRequests[index].status = AdoptionStatus.rejected;
      notifyListeners();
    }
  }

  List<AdoptionRequest> getAdoptionRequestsForPet(String petId) {
    return _adoptionRequests.where((request) => request.petId == petId).toList();
  }
}