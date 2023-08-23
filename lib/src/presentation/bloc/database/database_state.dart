import 'package:equatable/equatable.dart';
import 'package:plaff_kebab/src/data/source/hive/product.dart';

class DatabaseState extends Equatable {
  final List<Products> products;
  final DatabaseStatus status;

  const DatabaseState({
    this.products = const [],
    this.status = DatabaseStatus.initial,
  });

  DatabaseState copyWith({
    List<Products>? products,
    DatabaseStatus? status,
  }) {
    return DatabaseState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [
        products,
        status,
      ];
}

enum DatabaseStatus {
  initial,
  loading,
  success,
  error,
}

extension ProductStatusX on DatabaseStatus {
  bool get isInitial => this == DatabaseStatus.initial;

  bool get isLoading => this == DatabaseStatus.loading;

  bool get isSuccess => this == DatabaseStatus.success;

  bool get isError => this == DatabaseStatus.error;
}
