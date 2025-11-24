import 'package:flutter/material.dart';

class MyXLSimpleUI extends StatelessWidget {
  const MyXLSimpleUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: const Text("myXL Sederhana"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // =======================
            // Bagian Kartu Utama
            // =======================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade800,
                    Colors.blue.shade500,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo
                  Row(
                    children: [
                      Icon(Icons.sim_card, color: Colors.white, size: 40),
                      const SizedBox(width: 12),
                      const Text(
                        "XL Axiata",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    "Nomor Anda",
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  const Text(
                    "0812-3456-7890",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _InfoSmall(title: "Pulsa", value: "Rp 25.000"),
                      _InfoSmall(title: "Kuota", value: "12 GB"),
                      _InfoSmall(title: "Aktif", value: "30 Hari"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Beli Paket"),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // =======================
            // Menu Cepat (Seperti MyXL)
            // =======================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _MenuItem(icon: Icons.wifi, label: "Internet"),
                _MenuItem(icon: Icons.phone_android, label: "Pulsa"),
                _MenuItem(icon: Icons.card_giftcard, label: "Promo"),
                _MenuItem(icon: Icons.manage_accounts, label: "Akun"),
              ],
            ),

            const SizedBox(height: 25),

            // =======================
            // Card Promo
            // =======================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    offset: Offset(0, 3),
                    color: Colors.black12,
                  )
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.local_offer, color: Colors.blue.shade600, size: 40),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      "Dapatkan Promo Internet 20GB Cuma 30.000!",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =======================
// Widget kecil untuk Info (Pulsa, Kuota, dll)
// =======================
class _InfoSmall extends StatelessWidget {
  final String title;
  final String value;

  const _InfoSmall({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: Colors.white70, fontSize: 13)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// =======================
// Widget Menu (icon + text)
// =======================
class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MenuItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.blue.shade600,
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
