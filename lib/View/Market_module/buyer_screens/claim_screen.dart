import 'package:flutter/material.dart';
import 'package:market_module/Market_module/Model/order.dart';

class ClaimScreen extends StatefulWidget {
  final Order order;

  const ClaimScreen({Key? key, required this.order}) : super(key: key);

  @override
  _ClaimScreenState createState() => _ClaimScreenState();
}

class _ClaimScreenState extends State<ClaimScreen> {
  final _formKey = GlobalKey<FormState>();
  String _claimType = 'wrong_item';
  String _description = '';
  List<String> _evidenceImages = [];

  final List<String> _claimTypes = [
    'wrong_item',
    'damaged_item',
    'fake_product',
    'item_not_received',
    'significantly_different'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File a Claim'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Order Summary
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Summary',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Item: ${widget.order.itemName}'),
                      Text('Seller: ${widget.order.seller}'),
                      Text('Order ID: ${widget.order.orderId}'),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 20),
              
              // Claim Type
              Text(
                'Issue Type',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField(
                value: _claimType,
                items: [
                  DropdownMenuItem(value: 'wrong_item', child: Text('Wrong item received')),
                  DropdownMenuItem(value: 'damaged_item', child: Text('Item arrived damaged')),
                  DropdownMenuItem(value: 'fake_product', child: Text('Fake/counterfeit product')),
                  DropdownMenuItem(value: 'item_not_received', child: Text('Item not received')),
                  DropdownMenuItem(value: 'significantly_different', child: Text('Significantly different from description')),
                ],
                onChanged: (value) {
                  setState(() {
                    _claimType = value.toString();
                  });
                },
              ),
              
              SizedBox(height: 20),
              
              // Description
              Text(
                'Describe the issue in detail',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Please describe what happened...',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe the issue';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _description = value;
                  });
                },
              ),
              
              SizedBox(height: 20),
              
              // Evidence Upload
              Text(
                'Upload Evidence (Photos/Videos)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _uploadEvidence,
                icon: Icon(Icons.camera_alt),
                label: Text('Add Photos'),
              ),
              
              SizedBox(height: 20),
              
              // Submit Button
              ElevatedButton(
                onPressed: _submitClaim,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  'Submit Claim',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _uploadEvidence() {
    // Implement image picker functionality
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Upload Evidence'),
        content: Text('This would open camera/gallery to upload evidence photos'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _submitClaim() {
    if (_formKey.currentState!.validate()) {
      // Submit claim to your backend
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Claim Submitted'),
          content: Text('Your claim has been submitted successfully. We will review it within 24-48 hours.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Go back to history screen
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
      
      // Update order status to disputed
      print('Claim submitted for order: ${widget.order.orderId}');
      print('Claim type: $_claimType');
      print('Description: $_description');
    }
  }
}