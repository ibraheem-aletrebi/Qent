import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:quent/core/services/network/api_local_status_code.dart';
import 'package:quent/core/widgets/custom_error_widget.dart';
import 'package:quent/core/widgets/paginated_search_dropdown/components/search_field.dart';
import 'package:quent/generated/l10n.dart';
import '../cubit/paginated_dropdown_cubit.dart';
import '../cubit/paginated_dropdown_state.dart';

class DropdownBottomSheet<T> extends StatefulWidget {
  const DropdownBottomSheet({
    super.key,
    required this.item,
    this.itemBuilder,
    this.onSelecte,
  });

  final String Function(T) item;
  final Widget Function(BuildContext context, T item, bool isSelected)?
  itemBuilder;
  final Function(T)? onSelecte;
  @override
  State<DropdownBottomSheet<T>> createState() => _DropdownBottomSheetState<T>();
}

class _DropdownBottomSheetState<T> extends State<DropdownBottomSheet<T>> {
  late final TextEditingController _searchController;
  late final FocusNode _focusNode;
  late final ScrollController _scrollController;

  PaginatedDropdownCubit<T> get cubit =>
      context.read<PaginatedDropdownCubit<T>>();

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
    _focusNode = FocusNode();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    if (cubit.state.items.isEmpty) {
      cubit.init();
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      cubit.loadMore();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  bool _isSelected(T item, T? selectedItem) {
    if (selectedItem == null) return false;
    return selectedItem == item;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: context.watch<ThemeCubit>().isDarkMode
            ? Colors.black
            : Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          const _HandleBar(),
          SearchField(
            controller: _searchController,
            onChanged: cubit.onSearchChanged,
          ),
          Expanded(
            child:
                BlocBuilder<
                  PaginatedDropdownCubit<T>,
                  PaginatedDropdownState<T>
                >(
                  builder: (context, state) {
                    if (state.isLoading && state.items.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.error != null && state.items.isEmpty) {
                      if (state.error!.statusCode ==
                          ApiLocalStatusCode.connectionError) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomErrorWidget(error: state.error!),
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: () => cubit.loadData(reset: true),
                              child: Text(S.of(context).retry),
                            ),
                          ],
                        );
                      }
                      return Center(child: Text(state.error!.message));
                    }

                    if (state.items.isEmpty) {
                      return Center(child: Text(S.of(context).noItemFound));
                    }

                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: state.items.length + (state.hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == state.items.length) {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }

                        final item = state.items[index];
                        final isSelected = _isSelected(
                          item,
                          state.selectedItem,
                        );

                        if (widget.itemBuilder != null) {
                          return GestureDetector(
                            onTap: () {
                              widget.onSelecte?.call(item);
                              cubit.selectItem(item);
                              Navigator.pop(context);
                            },
                            child: widget.itemBuilder!(
                              context,
                              item,
                              isSelected,
                            ),
                          );
                        }

                        return ListTile(
                          title: Text(
                            widget.item(item),
                            style: TextTheme.of(context).titleMedium,
                          ),
                          trailing: isSelected ? const Icon(Icons.check) : null,
                          onTap: () {
                            widget.onSelecte?.call(item);
                            cubit.selectItem(item);
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}

class _HandleBar extends StatelessWidget {
  const _HandleBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
