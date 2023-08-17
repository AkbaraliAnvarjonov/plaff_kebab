part of 'package:plaff_kebab/src/presentation/pages/main/home/home_page.dart';

mixin HomeMixin on State<HomePage> {
  late final ScrollController scrollController;
  late final HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(const GetCategoryEvent());
    scrollController = ScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!mounted) return;
    bloc = context.read<HomeBloc>();
  }

  void listener(BuildContext context, HomeState state) {
    if (state.isScrollingTop) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      bloc.add(const HomeScroll(isScrollingTop: false));
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
