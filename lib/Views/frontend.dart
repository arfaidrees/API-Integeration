import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Api_Integeration.dart';

class frontendtest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Open the drawer
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Handle the tap
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Received and Shop Stock in a Row
            Row(
              children: [
                Expanded(child: _buildTotalReceivedSection()),
                const SizedBox(width: 16),
                Expanded(child: _buildShopStockSection()),
              ],
            ),
            const SizedBox(height: 20),

            // Recent Orders Section
            _buildRecentOrdersSection(),
            const SizedBox(height: 20),

            // All Floors in a Row
            Row(
              children: [
                Expanded(child: _buildFloorSection('1st Floor')),
                const SizedBox(width: 16),
                Expanded(child: _buildFloorSection('2nd Floor')),
                const SizedBox(width: 16),
                Expanded(child: _buildFloorSection('3rd Floor')),
              ],
            ),
            const SizedBox(height: 20),

            // Horizontal Scrollable Cards
            _buildHorizontalScrollableCards(),
            const SizedBox(height: 20),


            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrdersPage()),
                  );
                },
                child: const Text('Check API Integration',  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalReceivedSection() {
    return Card(
      elevation: 4,
      color: Colors.blueGrey, // Background color
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Received',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              '\$50000',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShopStockSection() {
    return Card(
      elevation: 4,
      color: Colors.brown.withOpacity(0.4), // Background color
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shop Stock',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              '500 items',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentOrdersSection() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Orders',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildOrderItem('ORD001', 'John Doe', '1234 Elm Street', 'Jan 29, 2025', 2, 45.99),
            _buildOrderItem('ORD002', 'Jane Smith', '5678 Oak Avenue', 'Jan 28, 2025', 1, 30.99),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(String orderId, String customer, String address, String date, int qty, double price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const SizedBox(height: 8),
        Text(
          orderId,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text('Customer: $customer'),
        Text('Address: $address'),
        Text('Date: $date'),
        Text('Qty: $qty'),
        Text('Price: \$${price.toStringAsFixed(2)}'),
      ],
    );
  }

  Widget _buildFloorSection(String floor) {
    return Card(
      elevation: 4,
      color: Colors.black, // Black background
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            floor,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white, // White text
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalScrollableCards() {
    return Container(
      height: 100, // Adjust height as needed
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildScrollableCard(),
          _buildScrollableCard(),
          _buildScrollableCard(),
        ],
      ),
    );
  }

  Widget _buildScrollableCard() {
    return Container(
      width: 150, // Adjust width as needed
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.black, // Black background
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}