import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_riverpod/global/utils/app_state.dart';
import 'package:flutter_base_riverpod/global/widgets/dialog_widget.dart';
import 'package:flutter_base_riverpod/global/widgets/loading_overlay.dart';
import 'package:flutter_base_riverpod/modules/sign_up/sign_up_provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../gen/strings.g.dart';
import '../../global/routers/app_router.dart';
import '../../global/themes/app_colors.dart';
import '../../global/widgets/label.dart';

@RoutePage()
class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final formKey = GlobalKey<FormBuilderState>();
  late final provider = ref.watch(signUpProvider.notifier);
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;

  void signUp() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (formKey.currentState?.saveAndValidate() == true) {
      final data = formKey.currentState!.value;
      provider.signUpWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
        fullName: data['fullName'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final i18n = Translations.of(context);
    final state = ref.watch(signUpProvider);

    ref.listen(signUpProvider, (_, next) {
      next.whenOrNull(
        data: (data, type) {
          showDialog(
            context: context,
            builder: (context) {
              return DialogWidget(
                onTapNegativeButton: null,
                titleText: i18n.signUp.title,
                contentText: i18n.signUp.success,
                onTapPositiveButton: () {
                  context.router.popUntilRouteWithName(SignInRoute.name);
                },
              );
            },
          );

          context.router.pop();
        },
        error: (e) => print(e),
      );
    });

    return LoadingOverlay(
      loading: state.isLoading,
      child: Scaffold(
        appBar: AppBar(),
        body: FormBuilder(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Label(i18n.login.email),
              FormBuilderTextField(
                name: 'email',
                decoration: InputDecoration(
                  hintText: i18n.login.emailHint,
                ),
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              Label(i18n.signUp.fullName),
              FormBuilderTextField(
                name: 'fullName',
                decoration: InputDecoration(
                  hintText: i18n.signUp.fullNameHint,
                ),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: i18n.signUp.fullNameRequired,
                    )
                  ],
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              Label(i18n.login.password),
              FormBuilderTextField(
                name: 'password',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: i18n.login.passwordRequired,
                    )
                  ],
                ),
                obscuringCharacter: '*',
                obscureText: passwordObscure,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
              ),
              Label(i18n.signUp.confirmPassword),
              FormBuilderTextField(
                name: 'confirmPassword',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: i18n.signUp.confirmPasswordRequired,
                    ),
                    (value) {
                      if (value !=
                          formKey.currentState?.fields['password']?.value) {
                        return i18n.signUp.passwordNotMatch;
                      }
                      return null;
                    },
                  ],
                ),
                obscuringCharacter: '*',
                obscureText: confirmPasswordObscure,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: i18n.signUp.confirmPasswordHint,
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
                          () =>
                              confirmPasswordObscure = !confirmPasswordObscure,
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: signUp,
                child: Text(i18n.signUp.title),
              )
            ],
          ),
        ),
      ),
    );
  }
}
