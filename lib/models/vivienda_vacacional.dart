class ViviendaVacacional {
  final String establishmentId;
  final String establishmentTradeName;
  final String establishmentType;
  final String establishmentCategory;
  final String establishmentClassification;
  final String address;
  final String addressIslandName;
  final String addressProvinceName;
  final String addressMunicipalityName;
  final String addressTownName;
  final String postcode;
  final String longitude;
  final String latitude;

  ViviendaVacacional({
    required this.establishmentId,
    required this.establishmentTradeName,
    required this.establishmentType,
    required this.establishmentCategory,
    required this.establishmentClassification,
    required this.address,
    required this.addressIslandName,
    required this.addressProvinceName,
    required this.addressMunicipalityName,
    required this.addressTownName,
    required this.postcode,
    required this.longitude,
    required this.latitude,
  });

  factory ViviendaVacacional.fromJson(Map<String, dynamic> json) {
    return ViviendaVacacional(
      establishmentId: json['establecimiento_id'],
      establishmentTradeName: json['establecimiento_nombre_comercial'],
      establishmentType: json['establecimiento_modalidad'],
      establishmentCategory: json['establecimiento_tipologia'],
      establishmentClassification: json['establecimiento_clasificacion'],
      address: json['direccion'],
      addressIslandName: json['direccion_isla_nombre'],
      addressProvinceName: json['direccion_provincia_nombre'],
      addressMunicipalityName: json['direccion_municipio_nombre'],
      addressTownName: json['direccion_localidad_nombre'],
      postcode: json['direccion_codigo_postal'],
      longitude: json['longitud'],
      latitude: json['latitud'],
    );
  }
}
