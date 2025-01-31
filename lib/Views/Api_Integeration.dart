import 'package:flutter/material.dart';
import '../Model/orders.dart';
import '../Services/service.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late Future<OrdersResponse> futureOrders;

  @override
  void initState() {
    super.initState();
    futureOrders = ApiService().fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orders',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.white,
        child: FutureBuilder<OrdersResponse>(
          future: futureOrders,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(color: Colors.black, fontSize: 16), // Black text for error
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.orders.isEmpty) {
              return Center(
                child: Text(
                  'No orders found',
                  style: TextStyle(color: Colors.black, fontSize: 16), // Black text for no data
                ),
              );
            } else {
              return ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: snapshot.data!.orders.length,
                itemBuilder: (context, index) {
                  var order = snapshot.data!.orders[index];
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Order Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              order.imageUrl,
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Order ID: ${order.temporaryOrderId}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          _buildDetailRow(Icons.location_on, 'Floor: ${order.floor}'),
                          _buildDetailRow(Icons.store, 'Shop: ${order.shop}'),
                          _buildDetailRow(Icons.label, 'Tag: ${order.tag ?? "N/A"}'),
                          _buildDetailRow(Icons.schedule, 'Availability: ${order.availability ?? "N/A"}'),
                          _buildDetailRow(Icons.payment, 'Payment Type: ${order.paymentType ?? "N/A"}'),
                          _buildDetailRow(Icons.credit_card, 'Payment Mode: ${order.paymentMode ?? "N/A"}'),
                          _buildDetailRow(Icons.star, 'Status: ${order.status}'),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  // Helper method to build a detail row with an icon
  Widget _buildDetailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.black),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}