import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_riverpod/gen/assets.gen.dart';
import 'package:flutter_base_riverpod/global/repositories/user_repository.dart';
import 'package:flutter_base_riverpod/global/utils/app_state.dart';
import 'package:flutter_base_riverpod/global/widgets/loading_overlay.dart';
import 'package:flutter_base_riverpod/modules/sign_in/sign_in_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../global/routers/app_router.dart';
import '../../global/themes/app_colors.dart';
import '../../global/widgets/label.dart';
import '../../gen/strings.g.dart'; // import

@RoutePage()
class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final formKey = GlobalKey<FormBuilderState>();
  bool passwordObscure = true;
  late final provider = ref.watch(signInProvider.notifier);
  late final userProvider = ref.watch(userRepositoryProvider);

  void login() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.saveAndValidate()) {
      final data = formKey.currentState!.value;
      provider.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signInProvider);
    final i18n = Translations.of(context);
    ref.listen(
      signInProvider,
      (_, next) {
        next.whenOrNull(
          data: (data, _) {
            context.router.replaceAll([const MainRoute()]);
          },
          error: (e) => print(e),
        );
      },
    );

    return LoadingOverlay(
      loading: state.isLoading,
      child: Scaffold(
        body: FormBuilder(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Assets.images.hello.image(),
              Label(i18n.login.email),
              FormBuilderTextField(
                name: 'email',
                decoration: InputDecoration(
                  hintText: i18n.login.emailHint,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.email(
                      errorText: i18n.login.emailInvalid,
                    ),
                    FormBuilderValidators.required(
                      errorText: i18n.login.emailRequired,
                    )
                  ],
                ),
              ),
              Label(i18n.login.password),
              FormBuilderTextField(
                name: 'password',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: passwordObscure,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: i18n.login.passwordHint,
                  suffixIcon: SizedBox.square(
                    dimension: 40,
                    child: IconButton(
                      icon: Icon(
                        passwordObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.greyG200,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(
                          () => passwordObscure = !passwordObscure,
                        );
                      },
                    ),
                  ),
                ),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: i18n.login.passwordRequired,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: login,
                child: Text(i18n.login.title),
              ),
              const SizedBox(height: 18),
              OutlinedButton(
                onPressed: () {
                  context.router.push(const SignUpRoute());
                },
                child: Text(i18n.signUp.title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
