import 'package:flutter/material.dart';
import '../models/adoption_request.dart';

class AdoptionRequestCard extends StatelessWidget {
  final AdoptionRequest request;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const AdoptionRequestCard({
    Key? key,
    required this.request,
    required this.onApprove,
    required this.onReject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with name and status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                request.adoptersName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _getStatusColor(request.status).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _getStatusText(request.status),
                  style: TextStyle(
                    fontSize: 12,
                    color: _getStatusColor(request.status),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 16),
          
          // Request details
          _buildDetailRow('Email:', request.email),
          _buildDetailRow('Contact:', request.contact),
          _buildDetailRow('Address:', request.address),
          _buildDetailRow('Reason:', request.reason),
          _buildDetailRow('Other Pets:', request.otherPets),
          _buildDetailRow('Pet Details:', request.petDetails),
          _buildDetailRow('Children:', request.children),
          _buildDetailRow('Children Ages:', request.childrenAges),
          _buildDetailRow('Preferred Contact:', request.preferredContact),
          _buildDetailRow('Applied On:', request.appliedOn),
          
          SizedBox(height: 20),
          
          // Action buttons (only show if pending)
          if (request.status == AdoptionStatus.pending)
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onApprove,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'Approve',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onReject,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[600],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'Reject',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
  
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Color _getStatusColor(AdoptionStatus status) {
    switch (status) {
      case AdoptionStatus.pending:
        return Colors.orange;
      case AdoptionStatus.approved:
        return Colors.green;
      case AdoptionStatus.rejected:
        return Colors.red;
    }
  }
  
  String _getStatusText(AdoptionStatus status) {
    switch (status) {
      case AdoptionStatus.pending:
        return 'Pending';
      case AdoptionStatus.approved:
        return 'Approved';
      case AdoptionStatus.rejected:
        return 'Rejected';
    }
  }
}