import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';

import 'formulario.dart';

class GerarExcel {
// Método:
  Future<void> createExcel() async {
    final Workbook workbook = Workbook();

    final Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName('A1').setText('DATA/HORA');
    sheet.getRangeByName('B1').setText('MAQUINA');
    sheet.getRangeByName('C1').setText('INICIO PARADA');
    sheet.getRangeByName('D1').setText('VOLTA PARADA');
    sheet.getRangeByName('E1').setText('MOTIVO PARADA');
    sheet.getRangeByName('F1').setText('NATUREZA');

    ///// Passando dados gerados para planilha Excel
    int index = 2;
    for (int i = 0; i < dados.length; i++) {
      sheet
          .getRangeByName('A$index')
          .setText(DateFormat('dd/MM/yyyy - HH:mm').format(dados[i].dateTime));
      sheet.getRangeByName('B$index').setText(dados[i].maquina);
      sheet.getRangeByName('C$index').setText(dados[i].inicioParada);
      sheet.getRangeByName('D$index').setText(dados[i].voltaParada);
      sheet.getRangeByName('E$index').setText(dados[i].motivo);
      sheet.getRangeByName('F$index').setText(dados[i].radioDado);

      index++;
    }
    /////

    /// Abrindo planilha
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    final String path = (await getApplicationDocumentsDirectory()).path;
    final String fileName = '$path/Planilha_chamados.xlsx';
    final File file = File(fileName);
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(fileName);
  }
}
