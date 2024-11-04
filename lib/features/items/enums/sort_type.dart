/// Enum for sort type
enum SortType {
  date(label: "Sort by date"),
  name(label: "Sort by name"),
  fieldCount(label: "Sort by field count"),
  ;

  final String label;

  const SortType({required this.label});
}
