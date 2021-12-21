class MilkListModel {
  String id, date;
  int milk;
  MilkListModel({
    required this.id,
    required this.milk,
    required this.date,
  });
}

List<MilkListModel> mlist = [
  MilkListModel(id: '1223', milk: 12, date: '25-Oct-2021'),
  MilkListModel(id: '12345', milk: 12, date: '24-Oct-2021'),
  MilkListModel(id: '64342', milk: 12, date: '23-Oct-2021'),
  MilkListModel(id: '245', milk: 12, date: '11-Oct-2021'),
  MilkListModel(id: '23444', milk: 12, date: '21-Oct-2021'),
];
