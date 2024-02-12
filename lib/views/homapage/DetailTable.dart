import 'package:flutter/material.dart';
import 'package:project/model/SalesModel.dart';

class DetailTable extends StatelessWidget{
  final List<Sales> detailSales;

  const DetailTable({Key? key, required this.detailSales}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    for (var sale in detailSales) {
      print(sale.id);
      print(sale.brand);
      print(sale.volume);
      print(sale.profit);
    } 

 
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            child: DataTable(
                headingRowColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.08);
                  }
                  return Colors.blue; // Use the default value.
                }),
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Brand')),
                  DataColumn(label: Text('Volume')),
                  DataColumn(label: Text('Profit')),
                ],
                rows: detailSales.map((sale) => DataRow(cells: [
                    DataCell(Text(sale.id.toString())),
                    DataCell(Text(sale.brand)),
                    DataCell(Text(sale.volume.toString())),
                    DataCell(Text(sale.profit.toString()+"%")),
                  ])).toList(), 
            )
          ),
        ],
      ),
    );
  }

}