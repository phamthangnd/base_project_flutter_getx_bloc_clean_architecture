import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project/core/utils/dates_utils.dart';
import 'package:project/core/utils/print_utils.dart';
import 'package:project/data/remote/model/sample_dto.dart';
import 'package:project/presentation/ui/config/listing_view.dart';
import 'package:project/presentation/ui/config/route_config.dart';
import 'package:project/presentation/ui/config/ui_config.dart';

import 'clean_architecture_example_controller.dart';

class CleanArchitectureExamplePage extends StatefulWidget {
  static String route = "/cleanArchitectureExamplePage";

  @override
  _CleanArchitectureExamplePageState createState() =>
      _CleanArchitectureExamplePageState();
}

class _CleanArchitectureExamplePageState
    extends State<CleanArchitectureExamplePage> {
  final controller = Get.find<CleanArchitectureExampleController>();

  final GlobalKey<ListingViewState> listViewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Clean Architecture Example")),
        body: _content());
  }

  Widget _content() {
    return Obx(() {
      if (controller.sampleQuotableRX.value.results!.isNotEmpty) {
        Print("listLeadDTO : ${controller.sampleQuotableRX.value.results!.length}");
        listViewKey.currentState?.setItems(items: controller.sampleQuotableRX.value.results!);
      }
      return Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
                "Total Count: ${controller.sampleQuotableRX.value.totalCount} \n\n"
                "Total Pages: ${controller.sampleQuotableRX.value.totalPages}\n\n"
                "Count: ${controller.sampleQuotableRX.value.count}\n\n"
                "Page: ${controller.sampleQuotableRX.value.page}"),
          ),
          Expanded(child: listView()),
        ],
      );
    });
  }

  Widget listView() {
    return ListingView<SampleQuotableDTO>(
      key: listViewKey,
      enablePullUp: false,
      itemMargin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      listingWithSearchItemType: ListingWithSearchItemType.TYPE_CARD,
      onListProcessing: ({filterColumn, maxDate, minDate, pageNumber, pageSize, paging, searchText}) {
        // controller.getLeads();
      },
      onCreateListItem: (context, item, index, items) {
        return StatefulBuilder(builder: (context, setState2) {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            width: double.infinity,
            child: InkWell(
                onTap: () {
                  /*
            setState2(() {
              for (int i = 0; i < items.length; i++) {
                AllDriverListingData dto = items[i];
                if (index != i) {
                  dto.isSelected = false;
                }
              }

              item.isSelected = !item.isSelected;

              _myKey.currentState.onRefreshListView();
            });
            print("item.isSelected : ${item.isSelected}");
            */
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Icon(
                        FontAwesomeIcons.solidUser,
                        size: 20,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          "{item.customerName}",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      )
                    ]),
                    SizedBox(height: 10),
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Icon(
                        FontAwesomeIcons.mobileAlt,
                        size: 20,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          "{item.contactNo}",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      )
                    ]),
                    SizedBox(height: 10),
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Icon(
                        FontAwesomeIcons.users,
                        size: 20,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          "{item.contactedVia}",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      )
                    ]),
                    SizedBox(height: 10),
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Icon(
                        FontAwesomeIcons.solidAddressCard,
                        size: 20,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          "{item.contactedDetails}",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      )
                    ]),
                    SizedBox(height: 10),
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Icon(
                        FontAwesomeIcons.mapMarkedAlt,
                        size: 20,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          "{item.place}",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      )
                    ]),
                    SizedBox(height: 10),
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Icon(
                        FontAwesomeIcons.calendarCheck,
                        size: 20,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          "{DatesUtils.convertToHumanDate(item.date)}",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      )
                    ]),
                    Container(
                      height: 1,
                      color: Colors.blueGrey,
                      margin: EdgeInsets.only(top: 10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              // controller.getCreatedLeadById(item.leadNo, (LeadDTO? leadDTO) async {
                              //   var isRefresh = await Get.toNamed(RouteConfig.leadApproveCancel, arguments: [leadDTO]);
                              //
                              //   if (isRefresh != null && isRefresh as bool) {
                              //     listViewKey.currentState?.onRefresh();
                              //   }
                              // });
                            },
                            icon: Icon(FontAwesomeIcons.binoculars, size: 24, color: UIConfig.buttonColor)),
                        IconButton(
                            onPressed: () {
                              // controller.getCreatedLeadById(item.leadNo, (LeadDTO? leadDTO) async {
                              //   if (leadDTO != null) {
                              //     //Get.toNamed(RouteConfig.leadCreateUpdate, arguments: {LeadCreateUpdatePage.leadEditLeadDTOKey: leadDTO});
                              //     LeadCreateEditDTO? leadCreateEditDTO = LeadCreateEditDTO(
                              //         id: leadDTO.leadNo,
                              //         customerName: leadDTO.customerName,
                              //         contactedVia: leadDTO.contactedVia,
                              //         contactedDetails: leadDTO.contactedDetails,
                              //         contactNo: leadDTO.contactNo,
                              //         price: leadDTO.price,
                              //         place: leadDTO.place,
                              //         quantity: leadDTO.quantity,
                              //         description: leadDTO.description,
                              //         productId: leadDTO.productId,
                              //         productName: leadDTO.name);
                              //     var isRefresh = await Get.toNamed(RouteConfig.leadCreateUpdate, arguments: [leadCreateEditDTO]);
                              //
                              //     if (isRefresh != null && isRefresh as bool) {
                              //       listViewKey.currentState?.onRefresh();
                              //     }
                              //   }
                              // });
                            },
                            icon: Icon(FontAwesomeIcons.solidEdit, size: 24, color: UIConfig.buttonColor)),
                      ],
                    )
                  ],
                )),
          );
        });
      },
      getSavedDate: (item) {},
    );
  }

  @override
  void dispose() {
    Get.delete<CleanArchitectureExampleController>();
    super.dispose();
  }
}
