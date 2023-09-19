part of 'package:plaff_kebab/src/presentation/pages/main/my_orders/bookmark_page.dart';

mixin FavouriteMixin on State<FavoritesPage> {
  late final TabController tabController;

  @override
  void initState() {
    BlocProvider.of<OrderBloc>(context).add(const GetOrders());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!mounted) return;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
