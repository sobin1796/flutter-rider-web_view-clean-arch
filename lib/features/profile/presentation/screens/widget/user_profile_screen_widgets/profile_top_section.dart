import 'package:flutter/material.dart';
import 'package:tukaatuexpress/enum/the_states.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/features/profile/presentation/bloc/profile_state.dart';
import 'package:tukaatuexpress/features/profile/presentation/screens/widget/user_profile_screen_widgets/profile_avatar_with_edit.dart';
import 'package:tukaatuexpress/features/profile/presentation/screens/widget/user_profile_screen_widgets/profile_name_section.dart';

class ProfileTopSection extends StatelessWidget {
  const ProfileTopSection({
    required this.state,
    required this.noTokenAvailable,
    required this.fullName,
    super.key,
  });
  final ProfileState state;
  final bool noTokenAvailable;
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36, bottom: 20),
      child: Column(
        children: [
          const Align(child: Icon(Icons.settings_outlined)),
          ProfileAvatarWithEdit(
            avatar: state.profileResponse?.avatar ?? '',
            name: fullName,
            isLoading: state.theStates == TheStates.loading,
            isEditable:
                !noTokenAvailable && state.theStates != TheStates.loading,
            onEditTap: () {},
          ),
          const VerticalSpacing(10),
          ProfileNameSection(state: state, noTokenAvailable: noTokenAvailable),
        ],
      ),
    );
  }
}
