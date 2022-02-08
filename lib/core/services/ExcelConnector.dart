import 'package:syncfusion_flutter_xlsio/xlsio.dart';

class ExcelHandler {
  ExcelHandler();

  void excelSheetTools(){
    // New Excel Document
    Workbook workbook = new Workbook();
    //Accessing via Index
    workbook.worksheets[0];
    List<int> bytes = workbook.saveAsStream();
  }

}