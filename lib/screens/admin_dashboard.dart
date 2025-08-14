import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../widgets/dashboard_stat_card.dart';
import '../widgets/user_item.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue[400]!, Colors.blue[600]!],
                ),
              ),
              child: Text(
                'Admin Dashboard',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dashboard Statistics
                    Text(
                      'Dashboard Statistics',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    
                    SizedBox(height: 16),
                    
                    Consumer<AppProvider>(
                      builder: (context, provider, child) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: DashboardStatCard(
                                    icon: Icons.pets,
                                    count: provider.petListings,
                                    title: 'Pet Listings',
                                    color: Colors.blue[400]!,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: DashboardStatCard(
                                    icon: Icons.description,
                                    count: provider.adoptionRequestsCount,
                                    title: 'Adoption Requests',
                                    color: Colors.orange[400]!,
                                  ),
                                ),
                              ],
                            ),
                            
                            SizedBox(height: 12),
                            
                            Row(
                              children: [
                                Expanded(
                                  child: DashboardStatCard(
                                    icon: Icons.check_circle,
                                    count: provider.adoptedPetsCount,
                                    title: 'Adopted Pets',
                                    color: Colors.green[400]!,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: DashboardStatCard(
                                    icon: Icons.people,
                                    count: provider.usersCount,
                                    title: 'Users',
                                    color: Colors.purple[400]!,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    
                    SizedBox(height: 32),
                    
                    // User Management
                    Text(
                      'User Management',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    
                    SizedBox(height: 16),
                    
                    Consumer<AppProvider>(
                      builder: (context, provider, child) {
                        return Column(
                          children: provider.users.map((user) {
                            return UserItem(
                              user: user,
                              onDelete: () {
                                provider.deleteUser(user.id);
                              },
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}