import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'growth_page_model.dart';
export 'growth_page_model.dart';

class GrowthPageWidget extends StatefulWidget {
  const GrowthPageWidget({super.key});

  static String routeName = 'GrowthPage';
  static String routePath = '/growthPage';

  @override
  State<GrowthPageWidget> createState() => _GrowthPageWidgetState();
}

class _GrowthPageWidgetState extends State<GrowthPageWidget> {
  late GrowthPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GrowthPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 725.0,
                child: custom_widgets.LunaGrowth(
                  width: double.infinity,
                  height: 725.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
