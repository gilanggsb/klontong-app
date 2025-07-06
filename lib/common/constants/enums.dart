import 'package:json_annotation/json_annotation.dart';

enum BaseScreenType implements BaseType { view, edit, create, reorder }

sealed class BaseType implements Enum {
  static const view = BaseScreenType.view;
  static const edit = BaseScreenType.edit;
  static const create = BaseScreenType.create;
  static const reorder = BaseScreenType.reorder;

  static const List<BaseType> values = [view, edit, create, reorder];
}

extension BaseTypeExt on BaseType {
  bool get isCreate => this == BaseType.create;
  bool get isView => this == BaseType.view;
  bool get isEdit => this == BaseType.edit;
  bool get isReorder => this == BaseType.reorder;
}

enum AccountRole {
  driver("Driver"),
  supervisor("Supervisor"),
  admin("Admin");

  final String name;
  const AccountRole(this.name);
}

extension AccountRoleExt on AccountRole {
  bool get isSpv => this == AccountRole.supervisor;
  bool get isDriver => this == AccountRole.driver;
  bool get isAdmin => this == AccountRole.admin;
}

enum NumberPickerType { view, edit }

enum NotificationType { message, order }

enum DetailOrderScreenType { view, edit, placing }

extension DetailOrderScreenTypeExt on DetailOrderScreenType {
  bool get isView => this == DetailOrderScreenType.view;
  bool get isEdit => this == DetailOrderScreenType.edit;
  // synonym of loading
  bool get isPlacingOrLoadingOrder => this == DetailOrderScreenType.placing;
}

enum OrderLocationType { from, to }

enum DetailDeliveryScreenMode { reorder, edit }

extension DetailDeliveryScreenModeExt on DetailDeliveryScreenMode {
  bool get isReorder => this == DetailDeliveryScreenMode.reorder;
  bool get isEdit => this == DetailDeliveryScreenMode.edit;
}

enum DriverOrderTripListType { unsent, today }

enum DriverOrderCardChoicesType {
  seeMap("Lihat map"),
  uploadAttachment("Upload Document"),
  seeDetails("Lihat detail"),
  getTotheDestination("Sampai ke tujuan");

  final String value;
  const DriverOrderCardChoicesType(this.value);
}

extension DriverOrderCardChoicesTypeExt on DriverOrderCardChoicesType {
  bool get isUploadAttachment => this == DriverOrderCardChoicesType.uploadAttachment;
  bool get isSeeMap => this == DriverOrderCardChoicesType.seeMap;
  bool get isSeeDetails => this == DriverOrderCardChoicesType.seeDetails;
  bool get isGetToTheDest => this == DriverOrderCardChoicesType.getTotheDestination;
}

enum ChecklistTableType { checklist, view, edit }

extension ChecklistTableTypeExt on ChecklistTableType {
  bool get isChecklist => this == ChecklistTableType.checklist;
  bool get isView => this == ChecklistTableType.view;
  bool get isEdit => this == ChecklistTableType.edit;
}

enum HomeAdminTabEnum { driver, supervisor }

extension HomeAdminTabEnumExt on HomeAdminTabEnum {
  bool get isDriver => this == HomeAdminTabEnum.driver;
  bool get isSupervisor => this == HomeAdminTabEnum.supervisor;
}

enum CreateEditProfileScreenEnum { edit, create }

extension CreateEditProfileScreenEnumExt on CreateEditProfileScreenEnum {
  bool get isEdit => this == CreateEditProfileScreenEnum.edit;
  bool get isCreate => this == CreateEditProfileScreenEnum.create;
}

enum DriverDetailOrderScreenType {
  uploadAttachment('upload_attachment'),
  checklistOrder('checklist_order'),
  view('detail'),
  loading('loading');

  final String value;

  const DriverDetailOrderScreenType(this.value);
}

extension DriverDetailOrderScreenTypeExt on DriverDetailOrderScreenType {
  bool get isUploadAttachment => this == DriverDetailOrderScreenType.uploadAttachment;
  bool get isChecklistOrder => this == DriverDetailOrderScreenType.checklistOrder;
  bool get isView => this == DriverDetailOrderScreenType.view;
  bool get isLoading => this == DriverDetailOrderScreenType.loading;
}

enum ProfileScreenType { view, control }

extension ProfileScreenTypeExt on ProfileScreenType {
  bool get isView => this == ProfileScreenType.view;
  bool get isControl => this == ProfileScreenType.control;
}

enum DownloadType {
  pdf('Download PDF', 'pdf'),
  excel('Download Excel', 'xlsx');

  final String value;
  final String fileType;
  const DownloadType(this.value, this.fileType);
}

extension DownloadTypeExt on DownloadType {
  bool get isPdf => this == DownloadType.pdf;
  bool get isExcel => this == DownloadType.excel;
}

enum ReportMenuType {
  onTimeDelivery('on_time_delivery_report'),
  tripOrderMonitoring('trip_order_monitoring'),
  kpiDriver('kpi_driver'),
  dailyRitase('daily_ritase'),
  defect('defect_report'),
  byDriver('report_by_driver');

  final String value;
  const ReportMenuType(this.value);
}

extension ReportMenuTypeExt on ReportMenuType {
  bool get isOnTimeDelivery => this == ReportMenuType.onTimeDelivery;
  bool get isKpiDriver => this == ReportMenuType.kpiDriver;
  bool get isDailyRitase => this == ReportMenuType.dailyRitase;
  bool get isDefect => this == ReportMenuType.defect;
  bool get isByDriver => this == ReportMenuType.byDriver;
}

enum ScreenSizeType { small, medium, large }

extension ScreenSizeTypeExt on ScreenSizeType {
  bool get isSmall => this == ScreenSizeType.small;
  bool get isMedium => this == ScreenSizeType.medium;
  bool get isLarge => this == ScreenSizeType.large;
}

enum BaseLocationDataType {
  @JsonValue("none")
  none,
  @JsonValue("current")
  current,
  @JsonValue("origin")
  origin,
  @JsonValue("warehouse")
  warehouse,
  @JsonValue("destination")
  destination,
}

extension BaseLocationDataTypeExt on BaseLocationDataType {
  bool get isNone => this == BaseLocationDataType.none;
  bool get isCurrent => this == BaseLocationDataType.current;
  bool get isOrigin => this == BaseLocationDataType.origin;
  bool get isWarehouse => this == BaseLocationDataType.warehouse;
  bool get isDestination => this == BaseLocationDataType.destination;
}

enum DocumentCubitMode { view, edit }

extension DocumentCubitModeExt on DocumentCubitMode {
  bool get isView => this == DocumentCubitMode.view;
  bool get isEdit => this == DocumentCubitMode.edit;
}

enum DeliveryDriverDashboardMode { driverList, driverDetail, view }

extension DeliveryDriverDashboardModeExt on DeliveryDriverDashboardMode {
  bool get isDriverList => this == DeliveryDriverDashboardMode.driverList;
  bool get isDriverDetail => this == DeliveryDriverDashboardMode.driverDetail;
  bool get isView => this == DeliveryDriverDashboardMode.view;
}

mixin BaseTypeMixin<T extends Enum> on Enum {
  bool get isCreate => name == 'create';
  bool get isView => name == 'view';
  bool get isEdit => name == 'edit';
  bool get isReorder => name == 'reorder';
}

enum SelectedOrderMode with BaseTypeMixin { view, edit, create, reorder }
