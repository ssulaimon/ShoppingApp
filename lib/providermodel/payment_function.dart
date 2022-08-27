import 'dart:developer';
import 'dart:io';

import 'package:lecle_downloads_path_provider/constants/downloads_directory_type.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:test_app/providermodel/payment.details.dart';

class PaymentFuction {
  Future<String?> paymentDetails({
    required String name,
    required String cvv,
    required String expMonth,
    required String expYear,
    required String cardNumber,
    required String date,
    required String amountPaid,
    required String itemNumber,
    required String items,
  }) async {
    try {
      PaymentDetails payment = PaymentDetails(
        amountPaid: amountPaid,
        cardNumber: cardNumber,
        cvv: cvv,
        date: date,
        expMonth: expMonth,
        expYear: expYear,
        name: name,
        itemNumber: itemNumber,
      );

      var pdf = Document();
      pdf.addPage(
        Page(
          build: (context) {
            return Column(children: [
              Text(
                'Name on Card : $name',
                style: const TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Date of payment : $date',
                style: const TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Number of Item : $itemNumber',
                style: const TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Card Number : $cardNumber',
                style: const TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Expire Year: $expYear',
                style: const TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Expire of Month : $expMonth',
                style: const TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Purchase Products: \$$items',
                style: const TextStyle(fontSize: 15.0),
              ),
              SizedBox(
                height: 50,
              ),
              Divider(thickness: 2.0),
              Text(
                'Total Payment : \$$amountPaid',
                style: const TextStyle(fontSize: 20.0),
              ),
            ]);
          },
          pageFormat: PdfPageFormat.a4,
        ),
      );

      var download = await DownloadsPath.downloadsDirectory();
      var file = File('${download?.path}/$name.pdf');

      file.writeAsBytes(await pdf.save());
      return 'completed';
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }
}
