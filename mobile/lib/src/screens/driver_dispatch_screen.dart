import 'package:flutter/material.dart';

class DeliveryStop {
  final String id;
  final String address;
  final String customer;
  final String eta;
  final int packages;
  bool isCompleted;

  DeliveryStop({
    required this.id,
    required this.address,
    required this.customer,
    required this.eta,
    required this.packages,
    this.isCompleted = false,
  });
}

class DriverDispatchScreen extends StatefulWidget {
  const DriverDispatchScreen({super.key});

  @override
  State<DriverDispatchScreen> createState() => _DriverDispatchScreenState();
}

class _DriverDispatchScreenState extends State<DriverDispatchScreen> {
  final List<DeliveryStop> _stops = [
    DeliveryStop(id: 'STOP-101', address: '142 Avenue de la Gare', customer: 'Pharmacie Central', eta: '10:15', packages: 3, isCompleted: true),
    DeliveryStop(id: 'STOP-102', address: '85 Rue du Commerce', customer: 'SuperMarché Express', eta: '11:00', packages: 8),
    DeliveryStop(id: 'STOP-103', address: '12 Boulevard des Alizés', customer: 'Boutique TechZone', eta: '11:45', packages: 2),
    DeliveryStop(id: 'STOP-104', address: '304 Route de l\'Aéroport', customer: 'Hôtel Plaza', eta: '12:30', packages: 5),
  ];

  bool _isAutoRerouting = true;
  double _fuelSavedPercent = 14.8;

  @override
  Widget build(BuildContext context) {
    final completedCount = _stops.where((s) => s.isCompleted).length;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.alt_route, color: Color(0xFF3B82F6)),
            SizedBox(width: 8),
            Text('RouteFlow Driver Studio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF10B981).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF10B981)),
            ),
            child: Row(
              children: [
                const Icon(Icons.local_fire_department, color: Color(0xFF10B981), size: 14),
                const SizedBox(width: 4),
                Text('-$_fuelSavedPercent% Carburant', style: const TextStyle(color: Color(0xFF10B981), fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Live Route Status Header Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF3B82F6).withValues(alpha: 0.3)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Route AI Active #RF-9482', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                            Text('Véhicule: Camionette-04 • Chauffeur: Jean Dupont', style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                        Switch(
                          value: _isAutoRerouting,
                          activeColor: const Color(0xFF3B82F6),
                          onChanged: (v) => setState(() => _isAutoRerouting = v),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: completedCount / _stops.length,
                      backgroundColor: Colors.white10,
                      color: const Color(0xFF3B82F6),
                      minHeight: 6,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$completedCount sur ${_stops.length} livraisons effectuées', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        const Text('Optimisation Trafic IA: ON', style: TextStyle(color: Color(0xFF10B981), fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              const Text('Ordre des Livraisons Optimisé', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 12),

              // Delivery Stops List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _stops.length,
                itemBuilder: (context, index) {
                  final stop = _stops[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: stop.isCompleted ? const Color(0xFF1E293B).withValues(alpha: 0.5) : const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: stop.isCompleted ? Colors.white10 : const Color(0xFF3B82F6).withValues(alpha: 0.4),
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: stop.isCompleted ? const Color(0xFF10B981) : const Color(0xFF3B82F6),
                        child: Icon(stop.isCompleted ? Icons.check : Icons.navigation, color: Colors.black, size: 20),
                      ),
                      title: Text(
                        stop.customer,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: stop.isCompleted ? Colors.grey : Colors.white,
                          decoration: stop.isCompleted ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      subtitle: Text('${stop.address} • ETA: ${stop.eta} (${stop.packages} colis)'),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: stop.isCompleted ? Colors.white12 : const Color(0xFF3B82F6),
                          foregroundColor: stop.isCompleted ? Colors.white70 : Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          setState(() => stop.isCompleted = !stop.isCompleted);
                        },
                        child: Text(stop.isCompleted ? 'Validé POD' : 'Livrer'),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
