import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/riwayat_controller.dart';

class RiwayatView extends GetView<RiwayatController> {
  const RiwayatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RiwayatController riwayatController = Get.put(RiwayatController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Transaksi'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await riwayatController.fetchRiwayat();
        },
        child: Obx(
          () {
            if (riwayatController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: riwayatController.riwayatList.length,
              itemBuilder: (context, index) {
                final riwayat = riwayatController.riwayatList[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Transaction Code: ${riwayat.transactionCode}',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text('Total: ${riwayat.total}'),
                      Text('Payment Method: ${riwayat.paymentMethod}'),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: _getStatusColor(riwayat.status),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          riwayat.status,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

Color _getStatusColor(String status) {
  switch (status) {
    case 'Belum Bayar':
      return Colors.red;
    case 'Pembayaran Berhasil':
      return Colors.green;
    case 'Pesanan Dikirim':
      return Colors.blue;
    case 'Pesanan Ditolak':
      return Colors.grey;
    default:
      return Colors.black;
  }
}
