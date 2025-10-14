class Locality {
  final String id;
  final String name;
  final String village;
  final String neighborhood;
  final String city;
  final String country;
  final String state;

  Locality({
    required this.id,
    required this.name,
    required this.village,
    required this.neighborhood,
    required this.city,
    required this.country,
    required this.state,
  });

  factory Locality.fake() => Locality(
    id: '0',
    name: '',
    city: 'Ciudad',
    state: 'Departamento',
    country: 'País',
    neighborhood: 'Barrio',
    village: 'Villa',
  );
}
