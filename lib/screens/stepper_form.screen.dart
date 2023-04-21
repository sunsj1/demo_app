import 'package:demo_app/controllers/records.controller.dart';
import 'package:demo_app/models/records.dart';
import 'package:demo_app/screen1.dart';
import 'package:demo_app/widgets/form/field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:intl/intl.dart';

class RegisterRecords extends StatefulWidget {
  const RegisterRecords({super.key});
  @override
  State<RegisterRecords> createState() => _RegisterRecordsState();
}

class _RegisterRecordsState extends State<RegisterRecords> {
  final List<DropdownMenuItem<String>> serviceTypeOptions = const [
    DropdownMenuItem(value: 'Car Loan', child: Text('Car Loan')),
    DropdownMenuItem(value: 'Education Loan', child: Text('Education Loan')),
    DropdownMenuItem(value: 'Property Loan', child: Text('Property Loan')),
    DropdownMenuItem(value: 'Business Loan', child: Text('Business Loan')),
    DropdownMenuItem(value: 'Personal Loan', child: Text('Personal Loan')),
  ];
  final List<DropdownMenuItem<String>> sourceOptions = const [
    DropdownMenuItem(value: 'Personal', child: Text('Personal')),
    DropdownMenuItem(value: 'Referance', child: Text('Referance')),
    DropdownMenuItem(value: 'Google', child: Text('Google')),
    DropdownMenuItem(value: 'LinkedIn', child: Text('LinkedIn')),
    DropdownMenuItem(value: 'Instagram', child: Text('Instagram')),
    DropdownMenuItem(value: 'Facebook', child: Text('Facebook')),
    DropdownMenuItem(value: 'Dailer', child: Text('Dailer')),
  ];
  final List<DropdownMenuItem<String>> leadStatusOptions = const [
    DropdownMenuItem(value: 'Cancelled', child: Text('Cancelled')),
    DropdownMenuItem(value: 'Pre_LogIn', child: Text('Pre_LogIn')),
    DropdownMenuItem(value: 'Follow_up', child: Text('Follow_up')),
    DropdownMenuItem(
        value: 'Documents Pending', child: Text('Documents Pending')),
    DropdownMenuItem(
        value: 'All Docs Recived', child: Text('All Docs Recived')),
    DropdownMenuItem(value: 'LoggedIn', child: Text('LoggedIn')),
    DropdownMenuItem(
        value: 'Banker Verification', child: Text('Banker Verification')),
    DropdownMenuItem(value: 'Approval', child: Text('Approval')),
  ];
  DateTime initialDate = DateTime.parse('1980-01-01T00:00:00Z');
  DateTime selectedDate = DateTime.parse('1980-01-01T00:00:00Z');
  int activeTabIndex = 0;
  String? serviceTypeDropdownValue,
      sourceDropdownValue,
      leadStatusDropdownValue;
  //Controllers
  TextEditingController leadNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController secondaryMobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController experianceController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController companyPincodeController = TextEditingController();
  TextEditingController companyCityController = TextEditingController();
  TextEditingController dealAmountController = TextEditingController();
  TextEditingController serviceTypeController = TextEditingController();
  TextEditingController sourceController = TextEditingController();
  TextEditingController followupDateController = TextEditingController();
  TextEditingController followupTimeController = TextEditingController();
  TextEditingController leadStatusController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

//controller import
  final recordsController = Get.put(RecordsController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenRecords(
                            recordList: recordsController.recordList1,
                          )));
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Add Leads',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) {
                  if (activeTabIndex == 0) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: size.width),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      child: const Center(
                                        child: Text('1'),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Personal Information',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const FormFieldLabel('Name'),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Enter lead name',
                                  ),
                                  controller: leadNameController,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const FormFieldLabel('Mobile'),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Enter mobile number',
                                  ),
                                  controller: mobileController,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const FormFieldLabel('Secondary Mobile'),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Enter alternate mobile number',
                                  ),
                                  controller: secondaryMobileController,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const FormFieldLabel('Email'),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Enter email address',
                                  ),
                                  controller: emailController,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const FormFieldLabel('Address'),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Enter address',
                                  ),
                                  controller: addressController,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const FormFieldLabel('Pincode'),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: const InputDecoration(
                                    hintText: 'Enter pincode',
                                  ),
                                  controller: pincodeController,
                                ),
                              ]),
                        ),
                      ),
                    );
                  } else if (activeTabIndex == 1) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: size.width),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    child: const Center(
                                      child: Text('2'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Income Details',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const FormFieldLabel('Company/Business Name'),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter name',
                                ),
                                controller: companyNameController,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const FormFieldLabel('Experiance/Vintage'),
                              TextFormField(
                                decoration: const InputDecoration(),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                controller: experianceController,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const FormFieldLabel('Salary/Turnover'),
                              TextFormField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: const InputDecoration(),
                                controller: salaryController,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const FormFieldLabel('Company/Business Address'),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter address',
                                ),
                                controller: companyAddressController,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const FormFieldLabel('Pincode'),
                                        TextFormField(
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                          decoration: const InputDecoration(
                                            hintText: 'Enter pincode',
                                          ),
                                          controller: companyPincodeController,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const FormFieldLabel('City'),
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            hintText: 'Enter city',
                                          ),
                                          controller: companyCityController,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                    );
                  } else {
                    return ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: size.width),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    child: const Center(
                                      child: Text('3'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Loan Details',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const FormFieldLabel('Deal Amount'),
                              TextFormField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: const InputDecoration(
                                  hintText: 'Enter amount',
                                ),
                                controller: dealAmountController,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const FormFieldLabel('Service Type'),
                              DropdownButtonFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  hintStyle: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .fontSize,
                                    color: Colors.black45,
                                  ),
                                  hintText: 'Service Type',
                                  fillColor: Colors.white,
                                ),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .fontSize,
                                ),
                                items: serviceTypeOptions,
                                elevation: 4,
                                borderRadius: BorderRadius.circular(8.0),
                                alignment: AlignmentDirectional.bottomCenter,
                                onChanged: (value) {
                                  setState(() {
                                    serviceTypeDropdownValue = value.toString();
                                    serviceTypeController.text =
                                        serviceTypeDropdownValue ?? "NA";
                                  });
                                },
                                value: serviceTypeDropdownValue,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const FormFieldLabel('Source'),
                              DropdownButtonFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  hintStyle: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .fontSize,
                                    color: Colors.black45,
                                  ),
                                  hintText: 'Source',
                                  fillColor: Colors.white,
                                ),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .fontSize,
                                ),
                                items: sourceOptions,
                                elevation: 4,
                                borderRadius: BorderRadius.circular(8.0),
                                alignment: AlignmentDirectional.bottomCenter,
                                onChanged: (value) {
                                  setState(() {
                                    sourceDropdownValue = value.toString();
                                    sourceController.text =
                                        sourceDropdownValue ?? "NA";
                                  });
                                },
                                value: sourceDropdownValue,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const FormFieldLabel('Followup Date'),
                                        TextFormField(
                                          decoration: const InputDecoration(
                                              hintText: 'Enter Date of Birth'),
                                          controller: TextEditingController(
                                              text: DateFormat('dd-MM-yyyy')
                                                  .format(selectedDate)),
                                          readOnly: true,
                                          onTap: () async {
                                            _selectDate(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const FormFieldLabel('Time'),
                                        TextFormField(
                                          controller: followupTimeController,
                                          onTap: () {
                                            _selectTime(context);
                                          },
                                          decoration: const InputDecoration(
                                            labelText: 'Time',
                                            hintText: 'Tap to select time',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const FormFieldLabel('Lead Status'),
                              DropdownButtonFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  hintStyle: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .fontSize,
                                    color: Colors.black45,
                                  ),
                                  hintText: 'Status',
                                  fillColor: Colors.white,
                                ),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .fontSize,
                                ),
                                items: leadStatusOptions,
                                elevation: 4,
                                borderRadius: BorderRadius.circular(8.0),
                                alignment: AlignmentDirectional.bottomCenter,
                                onChanged: (value) {
                                  setState(() {
                                    leadStatusDropdownValue = value.toString();
                                    leadStatusController.text =
                                        leadStatusDropdownValue ?? "";
                                  });
                                },
                                value: leadStatusDropdownValue,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const FormFieldLabel('Remark'),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter remark',
                                ),
                                controller: remarksController,
                              ),
                            ]),
                      ),
                    );
                  }
                },
              ),
              _buildBottomButtonsBar(context),
            ],
          ),
        ),
      ),
    );
  }

  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        followupTimeController.text = DateFormat('hh:mm a').format(
          DateTime(2021, 1, 1, _selectedTime!.hour, _selectedTime!.minute),
        );
      });
    }
  }

  Future<void> _selectDate(
    BuildContext context,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1960, 1),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != initialDate) {
      setState(() {
        selectedDate = picked;
      });

      followupDateController.text =
          selectedDate.toUtc().toString().replaceAll(' ', 'T');
      return;
    }
    return;
  }

  SizedBox _buildBottomButtonsBar(BuildContext context) {
    return SizedBox(
      height: null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (activeTabIndex >= 1)
                Expanded(
                  child: Card(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary),
                      onPressed: () {
                        setState(() {
                          activeTabIndex = activeTabIndex - 1;
                        });
                      },
                      child: const Text('Previous'),
                    ),
                  ),
                ),
              if (activeTabIndex == 1)
                const SizedBox(
                  width: 10,
                ),
              if (activeTabIndex < 2)
                Expanded(
                  child: Card(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary),
                      onPressed: () {
                        setState(() {
                          activeTabIndex = activeTabIndex + 1;
                        });
                      },
                      child: const Text('Next'),
                    ),
                  ),
                ),
              if (activeTabIndex == 2)
                const SizedBox(
                  width: 10,
                ),
              if (activeTabIndex == 2)
                Expanded(
                  child: Card(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary),
                      onPressed: () {},
                      child: const Text('cancle'),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Card(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    onPressed: () {
                      if (activeTabIndex == 2) {
                        final record = Records(
                            leadName: leadNameController.text.toString(),
                            mobile: mobileController.text.toString(),
                            secondaryMobile: secondaryMobileController.text,
                            email: emailController.text.toString(),
                            address: addressController.text.toString(),
                            pincode: int.parse(pincodeController.text),
                            companyName: companyNameController.text.toString(),
                            experiance: int.parse(experianceController.text),
                            salary: int.parse(salaryController.text),
                            companyAddress:
                                companyAddressController.text.toString(),
                            companyPincode:
                                int.parse(companyPincodeController.text),
                            companyCity: companyCityController.text.toString(),
                            dealAmount: int.parse(dealAmountController.text),
                            serviceType: serviceTypeController.text.toString(),
                            source: sourceController.text.toString(),
                            followupDate:
                                followupDateController.text.toString(),
                            followupTime:
                                followupTimeController.text.toString(),
                            leadStatus: leadStatusController.text.toString(),
                            remarks: remarksController.text.toString());
                        Get.put(RecordsController()).createRecord(record);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScreenRecords(
                                  recordList: recordsController.recordList1,
                                )));
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ScreenRecords(
                                recordList: recordsController.recordList1,
                              )));
                    },
                    child: activeTabIndex == 2
                        ? const Text('Add')
                        : const Text('Cancel'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
