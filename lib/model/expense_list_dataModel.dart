class ExpenseListData {
  dynamic expenseCategoryId;
  dynamic expenseCategory;
  dynamic companyMasterID;
  dynamic status;
  dynamic createBy;
  dynamic updateBy;
  dynamic createByIp;
  dynamic updateByIp;
  // final dynamic createdAt;
  // final dynamic updatedAt;
  // final dynamic cmCompanyMasterID;
  // final dynamic cmCompanyName;
  // final dynamic cmCompanyAddress;
  // final dynamic cmCompanyWebsite;
  // final dynamic cmCompanyEmail;
  // final dynamic cmCompanyLogo;
  // final dynamic cmParentCompanyMasterID;
  // final dynamic cmSubCompanyRequired;
  // final dynamic cmStatus;
  // final dynamic cmCreateBy;
  // final dynamic cmUpdateBy;
  // final dynamic cmCreateByIp;
  // final dynamic cmUpdateByIp;
  // final dynamic cmCreatedAt;
  // final dynamic cmUpdatedAt;
  // final dynamic cmCityMasterID;
  // final dynamic cmCompanyTypeid;
  // final dynamic cmCTMCityMasterID;
  // final dynamic cmCTMCityName;
  // final dynamic cmCTMStatus;
  // final dynamic cmCTMCreateBy;
  // final dynamic cmCTMUpdateBy;
  // final dynamic cmCTMcreateByIp;
  // final dynamic cmCTMUpdateByIp;
  // final dynamic cmCTMCreatedAt;
  // final dynamic cmCTMUpdatedAt;
  // final dynamic cmCTMStateMasterID;
  // final dynamic cmCTMsMstateMasterID;
  // final dynamic cmCTMsMstateName;
  // final dynamic cmCTMsMstateCode;
  // final dynamic cmCTMsMstatus;
  // final dynamic cmCTMsMcreateBy;
  // final dynamic cmCTMsMupdateBy;
  // final dynamic cmCTMsMcreateByIp;
  // final dynamic cmCTMsMupdateByIp;
  // final dynamic cmCTMsMcreatedAt;
  // final dynamic cmCTMsMupdatedAt;
  // final dynamic cmCTMsMcountryMasterID;
  // final dynamic cmCTMsMcMcountryMaste;
  // final dynamic cmCTMsMcMcountryName;
  // final dynamic cmCTMsMcMcountryCode;
  // final dynamic cmCTMsMcMstatus;
  // final dynamic cmCTMsMcMcreateBy;
  // final dynamic cmCTMsMcMupdateBy;
  // final dynamic cmCTMsMcMcreateByIp;
  // final dynamic cmCTMsMcMupdateByIp;
  // final dynamic cmCTMsMcMcreatedAt;
  // final dynamic cmCTMsMcMupdatedAt;
  // final dynamic cmCTcompanyTypeID;
  // final dynamic cmCTcompanyTypename;
  // final dynamic cmCTstatus;
  // final dynamic cmCTcreateBy;
  // final dynamic cmCTupdateBy;
  // final dynamic cmCTcreateByIp;
  // final dynamic cmCTupdateByIp;
  // final dynamic cmCTcreatedAt;
  // final dynamic cmCTupdatedAt;

  ExpenseListData(
      {this.expenseCategoryId,
      this.expenseCategory,
      this.companyMasterID,
      this.status,
      this.createBy,
      this.updateBy,
      this.createByIp,
      this.updateByIp
      // this.createdAt,
      // this.updatedAt,
      // this.cmCompanyMasterID,
      // this.cmCompanyName,
      // this.cmCompanyAddress,
      // this.cmCompanyWebsite,
      // this.cmCompanyEmail,
      // this.cmCompanyLogo,
      // this.cmParentCompanyMasterID,
      // this.cmSubCompanyRequired,
      // this.cmStatus,
      // this.cmCreateBy,
      // this.cmUpdateBy,
      // this.cmCreateByIp,
      // this.cmUpdateByIp,
      // this.cmCreatedAt,
      // this.cmUpdatedAt,
      // this.cmCityMasterID,
      // this.cmCompanyTypeid,
      // this.cmCTMCityMasterID,
      // this.cmCTMCityName,
      // this.cmCTMStatus,
      // this.cmCTMCreateBy,
      // this.cmCTMUpdateBy,
      // this.cmCTMcreateByIp,
      // this.cmCTMUpdateByIp,
      // this.cmCTMCreatedAt,
      // this.cmCTMUpdatedAt,
      // this.cmCTMStateMasterID,
      // this.cmCTMsMstateMasterID,
      // this.cmCTMsMstateName,
      // this.cmCTMsMstateCode,
      // this.cmCTMsMstatus,
      // this.cmCTMsMcreateBy,
      // this.cmCTMsMupdateBy,
      // this.cmCTMsMcreateByIp,
      // this.cmCTMsMupdateByIp,
      // this.cmCTMsMcreatedAt,
      // this.cmCTMsMupdatedAt,
      // this.cmCTMsMcountryMasterID,
      // this.cmCTMsMcMcountryMaste,
      // this.cmCTMsMcMcountryName,
      // this.cmCTMsMcMcountryCode,
      // this.cmCTMsMcMstatus,
      // this.cmCTMsMcMcreateBy,
      // this.cmCTMsMcMupdateBy,
      // this.cmCTMsMcMcreateByIp,
      // this.cmCTMsMcMupdateByIp,
      // this.cmCTMsMcMcreatedAt,
      // this.cmCTMsMcMupdatedAt,
      // this.cmCTcompanyTypeID,
      // this.cmCTcompanyTypename,
      // this.cmCTstatus,
      // this.cmCTcreateBy,
      // this.cmCTupdateBy,
      // this.cmCTcreateByIp,
      // this.cmCTupdateByIp,
      // this.cmCTcreatedAt,
      // this.cmCTupdatedAt
      });

  factory ExpenseListData.fromJson(Map<String, dynamic> json) {
    return ExpenseListData(
      expenseCategoryId: json['expenseCategoryId'] as dynamic,
      expenseCategory: json['expenseCategory'] as dynamic,
      companyMasterID: json['companyMasterID'] as dynamic,
      status: json['status'] as dynamic,
      createBy: json['createBy'] as dynamic,
      updateBy: json['updateBy'] as dynamic,
      createByIp: json['createByIp'] as dynamic,
      updateByIp: json['updateByIp'] as dynamic,
    );
  }

  static List<ExpenseListData> taskList = <ExpenseListData>[
    ExpenseListData(
      expenseCategoryId: 'expenseCategoryId' as dynamic,
      expenseCategory: 'expenseCategory' as dynamic,
      companyMasterID: 'companyMasterID' as dynamic,
      status: 'status' as dynamic,
      createBy: 'createBy' as dynamic,
      updateBy: 'updateBy' as dynamic,
      createByIp: 'createByIp' as dynamic,
      updateByIp: 'updateByIp' as dynamic,
    ),
  ];
}
