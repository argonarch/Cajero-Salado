class WidgetData {
  final int id;
  final String name;
  final double precio;
  final double beneficio;

  WidgetData(
      {required this.id,
        required this.name,
        required this.precio,
        required this.beneficio});

  factory WidgetData.fromJson(Map<String, dynamic> json) => WidgetData (
    id: json['id'],
    name: json['name'],
    precio: json['precio'],
    beneficio: json['beneficio'],
  );
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'precio': precio,
    'beneficio': beneficio,
  };
}
