import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ziya_lottery_app/Constants/app_colors.dart';
import 'package:ziya_lottery_app/features/privacy_policy/view_model/privacy_policy_vm.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PrivacyPolicyViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        title: const Text(
          "Privacy Policy",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: vm.policyList.length,
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final item = vm.policyList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.content,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            TextButton(
              onPressed: () {},
              child: Text(
                'privacy@slamart.com',
                style: TextStyle(color: AppColors.buttonClr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
