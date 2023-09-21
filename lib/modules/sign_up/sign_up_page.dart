import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_riverpod/global/utils/app_state.dart';
import 'package:flutter_base_riverpod/global/widgets/loading_overlay.dart';
import 'package:flutter_base_riverpod/modules/sign_up/sign_up_provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
    final state = ref.watch(signUpProvider);

    ref.listen(signUpProvider, (_, next) {
      next.whenOrNull(
        data: (data, type) {
          //back to login
        },
        error: (e) => print(e),
      );
    });

    return LoadingOverlay(
      loading: state.isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: FormBuilder(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Label('Login.Email'),
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(
                  hintText: 'Login.EmailHint',
                ),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.email(
                      errorText: 'Login.EmailInvalid',
                    ),
                    FormBuilderValidators.required(
                      errorText: 'Login.EmailRequired',
                    )
                  ],
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const Label('Login.FullName'),
              FormBuilderTextField(
                name: 'fullName',
                decoration: const InputDecoration(
                  hintText: 'Login.EmailHint',
                ),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.email(
                      errorText: 'Login.EmailInvalid',
                    ),
                    FormBuilderValidators.required(
                      errorText: 'Login.EmailRequired',
                    )
                  ],
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const Label('Login.Password'),
              FormBuilderTextField(
                name: 'password',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: 'Login.PasswordRequired',
                    )
                  ],
                ),
                obscuringCharacter: '*',
                obscureText: passwordObscure,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: 'Login.PasswordHint',
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
              const Label('Signup.ConfirmPassword'),
              FormBuilderTextField(
                name: 'confirmPassword',
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: 'Signup.ConfirmPasswordRequired',
                    ),
                    (value) {
                      if (value !=
                          formKey.currentState?.fields['password']?.value) {
                        return 'Signup.PasswordNotMatch';
                      }
                      return null;
                    },
                  ],
                ),
                obscuringCharacter: '*',
                obscureText: confirmPasswordObscure,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: 'Signup.ConfirmPasswordHint',
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
                child: const Text('Signup.Title'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
