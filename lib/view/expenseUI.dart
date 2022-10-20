import 'package:expensetask/model/expense_list_dataModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class ExpenseList extends StatefulWidget {
  const ExpenseList({Key key}) : super(key: key);

  @override
  ExpenseListState createState() => ExpenseListState();
}

class ExpenseListState extends State<ExpenseList> {
  ExpenseListData editExpense;

  Future future;
  Future future2;

  String displayErrorMessage = "";
  String errorMessage = "";

  String expenseCategoryId;
  String expenseCategory1;
  String companyMasterID;
  String createBy;
  String createByIp;
  String updateBy;
  String updateByIp;

  TextEditingController expenseCategoryIdController = TextEditingController();
  TextEditingController expenseCategory1Controller = TextEditingController();
  TextEditingController companyMasterIDController = TextEditingController();
  TextEditingController createByController = TextEditingController();
  TextEditingController createByIpController = TextEditingController();
  TextEditingController updateByController = TextEditingController();
  TextEditingController updateByIpController = TextEditingController();

  textfieldcontroller() {
    expenseCategoryIdController.text = editExpense.expenseCategoryId.toString();
    expenseCategory1Controller.text = editExpense.expenseCategory.toString();
    companyMasterIDController.text = editExpense.companyMasterID.toString();

    updateByController.text = editExpense.updateBy.toString() == "null"
        ? ""
        : editExpense.updateBy.toString();
    updateByIpController.text = editExpense.updateByIp.toString() == "null"
        ? ""
        : editExpense.updateByIp.toString();
  }

  @override
  void initState() {
    super.initState();

    future = getExpense();
    future2 = getEditExpense();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Container(
        child: Scaffold(
            appBar: AppBar(title: const Center(child: Text("Expense LIst"))),
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: <Widget>[
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            child: Column(children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(child: myFutureBuilder(future)),
                          const SizedBox(
                            height: 20,
                          ),
                        ])),
                      ),

                      //  )
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndFloat,
            floatingActionButton:
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              FloatingActionButton(
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {
                  _bottomSheetMoreEdit();
                },
              ),
              const SizedBox(
                width: 15,
              ),
              FloatingActionButton(
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  _bottomSheetMoreAdd();
                },
              )
            ])),
      ),
    );
  }

  myFutureBuilder(newFuture) {
    return FutureBuilder<List<ExpenseListData>>(
      future: future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView(
            padding: const EdgeInsets.all(8),
            children: snapshot.data
                .map((expense) => Container(
                        child: IntrinsicHeight(
                      child: Card(
                          color: Color.fromARGB(255, 235, 248, 249),
                          child: ListTile(
                            minVerticalPadding: 10,
                            subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(right: 20)),
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                IconButton(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 0,
                                                          left: 0,
                                                          top: 0,
                                                          bottom: 0),
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxWidth: 10,
                                                          maxHeight: 10),
                                                  iconSize: 20,
                                                  onPressed: () {
                                                    _bottomSheetMoreEdit();
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                          expense.expenseCategoryId == null
                                              ? const Text(
                                                  "Expense Category Id: ")
                                              : Text(
                                                  "Expense Category Id: ${expense.expenseCategoryId}",
                                                ),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 5)),
                                          expense.expenseCategory == null
                                              ? const Text("Expense Category: ")
                                              : Text(
                                                  "Expense Category: ${expense.expenseCategory}",
                                                ),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 5)),
                                          expense.companyMasterID == null
                                              ? const Text(
                                                  "Company Master ID: ")
                                              : Text(
                                                  "Company Master ID: ${expense.companyMasterID}"),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 5)),
                                          expense.status == null
                                              ? const Text("Status: ")
                                              : Text(
                                                  "Status: ${expense.status}"),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 5)),
                                          expense.createBy == null
                                              ? const Text("Create By: ")
                                              : Text(
                                                  "Create By: ${expense.createBy}"),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 5)),
                                          expense.updateBy == null
                                              ? const Text("Update By: ")
                                              : Text(
                                                  "Update By: ${expense.updateBy}"),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 5)),
                                          expense.createByIp == null
                                              ? const Text("Create By Ip: ")
                                              : Text(
                                                  "Create By Ip: ${expense.createByIp}"),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 5)),
                                          expense.updateByIp == null
                                              ? const Text("Update By Ip: ")
                                              : Text(
                                                  "Update By Ip: ${expense.updateByIp}"),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 15)),
                                        ]),
                                  ),
                                ]),
                            onTap: null,
                            contentPadding: const EdgeInsets.all(5.0),
                          )),
                    )))
                .toList(),
          );
        }
      },
    );
  }

  Future<List<ExpenseListData>> getExpense() async {
    // debugPrint("swati");
    var jsonResponse = await http.post(
        Uri.parse(
            "https://apitankhwapatra.tankhwapatra.co.in/expensecategory/v1/getExpenseCategorycompanyid"),
        body: {"limit": "", "page": "", "id": "4"});
    //  debugPrint("swati2");
    debugPrint(jsonResponse.body.toString());
    if (jsonResponse.statusCode == 200) {
      final jsonItems = List<Map<String, dynamic>>.from(
          json.decode(jsonResponse.body)['data']);

      List<ExpenseListData> expenseList =
          jsonItems.map<ExpenseListData>((json) {
        return ExpenseListData.fromJson(json);
      }).toList();

      return expenseList;
    } else {
      throw Exception('Failed to load data from internet');
    }
  }

  Future<bool> _onBackPressed() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => super.widget));
  }

  void _bottomSheetMoreAdd() {
    expenseCategory1Controller.text = "";
    companyMasterIDController.text = "";
    createByController.text = "";
    createByIpController.text = "";
    showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 20, bottom: 25),
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 223, 249, 251),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(15),
                          right: Radius.circular(15),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(mainAxisSize: MainAxisSize.min, children: <
                          Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Add Expense",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            style: const TextStyle(),
                            controller: expenseCategory1Controller,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.task,
                                color: Colors.black,
                                size: 30,
                              ),
                              labelText: "Expense Category 1",
                            ),
                            autocorrect: true,
                            onSaved: (value) {
                              expenseCategory1Controller.text =
                                  value.toString();
                            },
                            onChanged: (value) {
                              {
                                expenseCategory1 = value;
                              }
                            },
                            onFieldSubmitted: (value) {
                              expenseCategory1Controller.text =
                                  value.toString();
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            style: const TextStyle(),
                            controller: companyMasterIDController,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.task,
                                color: Colors.black,
                                size: 30,
                              ),
                              labelText: "Company Master ID",
                            ),
                            autocorrect: true,
                            onSaved: (value) {
                              companyMasterIDController.text = value.toString();
                            },
                            onChanged: (value) {
                              {
                                companyMasterID = value;
                              }
                            },
                            onFieldSubmitted: (value) {
                              companyMasterIDController.text = value.toString();
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            style: const TextStyle(),
                            controller: createByController,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.task,
                                color: Colors.black,
                                size: 30,
                              ),
                              labelText: "Created By",
                            ),
                            autocorrect: true,
                            onSaved: (value) {
                              createByController.text = value.toString();
                            },
                            onChanged: (value) {
                              {
                                createBy = value;
                              }
                            },
                            onFieldSubmitted: (value) {
                              createByController.text = value.toString();
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            style: const TextStyle(),
                            controller: createByIpController,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.task,
                                color: Colors.black,
                                size: 30,
                              ),
                              labelText: "Create By Ip",
                            ),
                            autocorrect: true,
                            onSaved: (value) {
                              createByIpController.text = value.toString();
                            },
                            onChanged: (value) {
                              {
                                createByIp = value;
                              }
                            },
                            onFieldSubmitted: (value) {
                              createByIpController.text = value.toString();
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            errorMessage = "ok";
                            errorMessage = checkFields();

                            //    print(errorMessage);

                            if (errorMessage != "ok") {
                              // print(errorMessage);
                              // print(expenseCategory1);
                              // print(companyMasterID);
                              // print(createBy);
                              // print(createByIp);

                              setState(() {
                                displayErrorMessage = errorMessage;
                              });
                              showAlertDialog(context, "Error", errorMessage);
                            } else {
                              postExpense();
                            }
                          },
                          child: const Text(
                            "Add",
                            style: TextStyle(
                                //
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ]))));
        });
  }

  void _bottomSheetMoreEdit() {
    textfieldcontroller();
    showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 20, bottom: 25),
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 223, 249, 251),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(15),
                          right: Radius.circular(15),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      child: FutureBuilder<ExpenseListData>(
                          future: future2,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                                return const Text('press button');
                              case ConnectionState.waiting:
                                return const Center(
                                    child: CircularProgressIndicator());

                              default:
                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                }

                                return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        "Edit Expense",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                          style: const TextStyle(),
                                          controller:
                                              expenseCategoryIdController,
                                          decoration: const InputDecoration(
                                            icon: Icon(
                                              Icons.task,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                            labelText: "Expense Category ID",
                                          ),
                                          autocorrect: true,
                                          validator: (String value) {
                                            if (value ==
                                                editExpense.expenseCategoryId
                                                    .toString()) {
                                              return 'expense Category id is Required';
                                            }
                                          },
                                          onSaved: (value) {
                                            expenseCategoryIdController.text =
                                                value.toString();
                                          },
                                          onChanged: (value) {
                                            {
                                              editExpense.expenseCategoryId =
                                                  value.toString();
                                              expenseCategoryId =
                                                  editExpense.expenseCategoryId;
                                            }
                                          },
                                          onFieldSubmitted: (value) {
                                            expenseCategoryIdController.text =
                                                value.toString();
                                          }),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                          style: const TextStyle(),
                                          controller:
                                              expenseCategory1Controller,
                                          decoration: const InputDecoration(
                                            icon: Icon(
                                              Icons.task,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                            labelText: "Expense Category 1",
                                          ),
                                          autocorrect: true,
                                          validator: (String value) {
                                            if (value ==
                                                editExpense.expenseCategory
                                                    .toString()) {
                                              return 'expense Category is Required';
                                            }
                                          },
                                          onSaved: (value) {
                                            expenseCategory1Controller.text =
                                                value.toString();
                                          },
                                          onChanged: (value) {
                                            {
                                              editExpense.expenseCategory =
                                                  value.toString();
                                              expenseCategory1 =
                                                  editExpense.expenseCategory;
                                            }
                                          },
                                          onFieldSubmitted: (value) {
                                            expenseCategory1Controller.text =
                                                value.toString();
                                          }),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                          style: const TextStyle(),
                                          controller: companyMasterIDController,
                                          decoration: const InputDecoration(
                                            icon: Icon(
                                              Icons.task,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                            labelText: "Company Master ID",
                                          ),
                                          autocorrect: true,
                                          validator: (String value) {
                                            if (value ==
                                                editExpense.companyMasterID
                                                    .toString()) {
                                              return 'Company Master ID is Required';
                                            }
                                          },
                                          onSaved: (value) {
                                            companyMasterIDController.text =
                                                value.toString();
                                          },
                                          onChanged: (value) {
                                            {
                                              editExpense.companyMasterID =
                                                  value.toString();
                                              companyMasterID =
                                                  editExpense.companyMasterID;
                                            }
                                          },
                                          onFieldSubmitted: (value) {
                                            companyMasterIDController.text =
                                                value.toString();
                                          }),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(),
                                          controller: updateByController,
                                          decoration: const InputDecoration(
                                            icon: Icon(
                                              Icons.task,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                            labelText: "Update By",
                                          ),
                                          autocorrect: true,
                                          validator: (String value) {
                                            if (value ==
                                                editExpense.updateBy
                                                    .toString()) {
                                              return 'Update by is Required';
                                            }
                                          },
                                          onSaved: (value) {
                                            updateByController.text =
                                                value.toString();
                                          },
                                          onChanged: (value) {
                                            {
                                              editExpense.updateBy =
                                                  value.toString();
                                              updateBy = editExpense.updateBy;
                                            }
                                          },
                                          onFieldSubmitted: (value) {
                                            updateByController.text =
                                                value.toString();
                                          }),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                          style: const TextStyle(),
                                          controller: updateByIpController,
                                          decoration: const InputDecoration(
                                            icon: Icon(
                                              Icons.task,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                            labelText: "Update By Ip",
                                          ),
                                          autocorrect: true,
                                          validator: (String value) {
                                            if (value ==
                                                editExpense.updateByIp
                                                    .toString()) {
                                              return 'Update by ip is Required';
                                            }
                                          },
                                          onSaved: (value) {
                                            updateByIpController.text =
                                                value.toString();
                                          },
                                          onChanged: (value) {
                                            {
                                              editExpense.updateByIp =
                                                  value.toString();
                                              updateByIp =
                                                  editExpense.updateByIp;
                                            }
                                          },
                                          onFieldSubmitted: (value) {
                                            updateByIpController.text =
                                                value.toString();
                                          }),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        color: Colors.blue,
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();
                                          // print('entering checkfields');
                                          errorMessage = "ok";
                                          errorMessage = checkFieldsForEdit();

                                          // print(errorMessage);

                                          if (errorMessage != "ok") {
                                            // print("ENTERED NOT OK");
                                            // print(errorMessage);
                                            // print(expenseCategory1);
                                            // print(companyMasterID);
                                            // print(createBy);
                                            // print(createByIp);

                                            setState(() {
                                              displayErrorMessage =
                                                  errorMessage;
                                            });
                                            showAlertDialogForEdit(
                                                context, "Error", errorMessage);
                                          } else {
                                            postEditExpense();
                                          }
                                        },
                                        child: const Text(
                                          "Update",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ]);
                            }
                          }))));
          //  });
          // });
        });
  }

  String checkFields() {
    if (expenseCategory1Controller.text == null ||
        expenseCategory1Controller.text == "") {
      return "Please mention expense Category 1";
    } else if (companyMasterIDController.text == null ||
        companyMasterIDController.text == "") {
      return "Please mention expense company Master ID";
    } else if (createByController.text == null ||
        createByController.text == "") {
      return "Please mention expense create By";
    } else if (createByIpController.text == null ||
        createByIpController.text == "") {
      return "Please mention expense create By Ip";
    } else {
      return "ok";
    }
  }

  String checkFieldsForEdit() {
    if (expenseCategory1Controller.text == null ||
        expenseCategory1Controller.text == "") {
      return "Please mention expense Category 1";
    } else if (companyMasterIDController.text == null ||
        companyMasterIDController.text == "") {
      return "Please mention expense company Master ID";
    } else if (updateByController.text == null ||
        updateByController.text == "") {
      return "Please mention expense update By";
    } else if (updateByController.text == null ||
        updateByController.text == "") {
      return "Please mention expense update By Ip";
    } else {
      return "ok";
    }
  }

  Future<bool> postExpense() async {
    return http.post(
        Uri.parse(
            "https://apitankhwapatra.tankhwapatra.co.in/expensecategory/v1/add"),
        body: {
          "expenseCategory1": expenseCategory1.toString(),
          "companyMasterID": companyMasterID.toString(),
          "createBy": createBy.toString(),
          "createByIp": createByIp.toString()
        }).then((res) {
      if (res != null) {
        {
          showAlertDialog(
              context, "Success", "Expense Category added successfully.");
        }
      }

      return true;
    });
  }

  showAlertDialog(BuildContext context, text1, text2) {
    Widget okButton = TextButton(
      child: const Text(
        "Ok",
      ),
      onPressed: () {
        Navigator.of(context).pop();
        expenseCategory1Controller.text = "";
        companyMasterIDController.text = "";
        createByController.text = "";
        createByIpController.text = "";
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        text1,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(text2),
      actions: [
        okButton,
      ],
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogForEdit(BuildContext context, text1, text2) {
    Widget okButton = TextButton(
      child: const Text(
        "Ok",
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        text1,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(text2),
      actions: [
        okButton,
      ],
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<ExpenseListData> getEditExpense() async {
    var jsonResponse = await http.get(
      Uri.parse(
          "https://apitankhwapatra.tankhwapatra.co.in/expensecategory/v1/getbyid/4"),
    );

    //print("edit expense:" + jsonResponse.body.toString());
    if (jsonResponse.statusCode == 200) {
      final jsonData = json.decode(jsonResponse.body)["data"];
      editExpense = ExpenseListData.fromJson(jsonData);
      return editExpense;
    } else {
      throw Exception('failed to load data fom internet');
    }
  }

  Future<bool> postEditExpense() async {
    // print('Inside the post Edit function');
    return http.post(
        Uri.parse(
            "https://apitankhwapatra.tankhwapatra.co.in/expensecategory/v1/updatebyid"),
        body: {
          "expenseCategoryId": expenseCategoryIdController.text,
          "expenseCategory1": expenseCategory1Controller.text,
          "companyMasterID": companyMasterIDController.text,
          "updateBy": updateByController.text,
          "updateByIp": updateByIpController.text
        }).then((res) {
      if (res != null) {
        {
          showAlertDialogForEdit(
              context, "Success", "Expense Category updated successfully.");
        }
      }
      return true;
    });
  }
}
