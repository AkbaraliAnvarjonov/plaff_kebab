part of 'package:plaff_kebab/src/presentation/pages/auth/register/register_page.dart';

mixin RegisterMixin on State<RegisterPage> {
  late final TextEditingController _fullNameController =
      TextEditingController();
  late final TextEditingController _phoneNumberController =
      TextEditingController();
  late final RegisterBloc _bloc = context.read<RegisterBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc.close();
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
  }

  void _registerUser(String phoneNumber) {
    final String phoneNum = "+998${phoneNumber.replaceAll(" ", "")}";
    _bloc.add(
      UserRegisterEvent(
        additionalProps: {
          'name': _fullNameController.text,
          'phone': phoneNum,
          'tag': "tag",
          'registration_source': 'app'
        },
        phoneNumber: phoneNum,
        fullName: _fullNameController.text,
      ),
    );
  }
}
