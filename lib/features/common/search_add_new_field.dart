import 'package:flutter/material.dart';
import 'package:tukaatuexpress/features/common/app_checkbox.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/features/common/app_text_field_wthout_label.dart';

class SearchAddNewField extends StatefulWidget {
  const SearchAddNewField({
    required this.searchController,
    required this.addNewController,
    required this.hintText,
    required this.areasOfInjury,
    required this.filterAreas,
    required this.addNewArea,
    required this.updateSelectedAreas,
    required this.selectedAreas,
    super.key,
    this.hideControls = false,
  });
  final TextEditingController searchController;
  final TextEditingController addNewController;
  final String hintText;
  final List<String> areasOfInjury;
  final Function(String) filterAreas;
  final Function(String) addNewArea;
  final Function(String, bool) updateSelectedAreas;
  final Set<String> selectedAreas;
  final bool hideControls;

  @override
  State<SearchAddNewField> createState() => _SearchAddNewFieldState();
}

class _SearchAddNewFieldState extends State<SearchAddNewField> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 400),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (!widget.hideControls)
              Column(
                children: [
                  AppTextFormFieldWithoutLabel(
                    controller: widget.searchController,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.arrow_back),
                    ),
                    hintText: widget.hintText,
                    onChanged: (query) => widget.filterAreas(query),
                  ),
                  const VerticalSpacing(8),
                  AppTextFormFieldWithoutLabel(
                    controller: widget.addNewController,
                    hintText: 'Add New',
                    suffixIcon: GestureDetector(
                      onTap: () =>
                          widget.addNewArea(widget.addNewController.text),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const VerticalSpacing(8),
                ],
              ),
            ...widget.areasOfInjury.map(
              (area) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    AppCheckbox(
                      value: widget.selectedAreas.contains(area),
                      onChanged: (isSelected) {
                        widget.updateSelectedAreas(area, isSelected!);
                      },
                    ),
                    const HorizontalSpacing(12),
                    Text(area),
                  ],
                ),
              ),
            ),
            const VerticalSpacing(16),
          ],
        ),
      ),
    );
  }
}
