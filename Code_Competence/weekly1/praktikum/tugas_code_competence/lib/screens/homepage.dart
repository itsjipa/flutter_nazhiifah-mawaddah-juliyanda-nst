import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tugas_code_competence/provider/form_data_provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    final formDataProvider = Provider.of<FormDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // welcome screen
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.transparent,
                        blurRadius: 1.5,
                      ),
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                      )
                    ],
                  ),
                  child: Image.network(
                    'https://i.pinimg.com/564x/3d/ba/ae/3dbaaed4b462639864cefd53221bce8e.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: 'Welcome, ',
                                style: GoogleFonts.pacifico(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.amber.shade900,
                                ),
                              ),
                              TextSpan(
                                text: 'to Dreams Heaven Art',
                                style: GoogleFonts.inriaSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        top: 55.0,
                        right: 10.0,
                      ),
                      child: Text(
                        "The world always seems brighter when you've just created something that didn't exist before. - Neil Gaiman",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.inriaSans(
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          color: Colors.white,
                          letterSpacing: 2,
                          wordSpacing: 2,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),

            // contact us
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Contact us',
                style: GoogleFonts.inriaSans(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: GoogleFonts.inriaSans(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                        text:
                            'Need to get in touch with us? Either fill out the form with your inquiry or find the '),
                    TextSpan(
                      text: 'department email',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        decorationThickness: 1.5,
                      ),
                    ),
                    TextSpan(text: " you'd like to contact below."),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 60.0,
              ),

              // form input
              child: Form(
                key: formDataProvider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // input first name
                        SizedBox(
                          width: 150,
                          height: 100,
                          
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your firstname';
                              }
                              return null;
                            },
                            controller: formDataProvider.firstNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  5.0,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  5.0,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              label: const Text('First Name'),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                            ),
                          ),
                        ),

                        // input last name
                        SizedBox(
                          width: 150,
                          height: 100,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your lastname';
                              }
                              return null;
                            },
                            controller: formDataProvider.lasstNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  5.0,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  5.0,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              label: const Text('Last Name'),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // input email
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        controller: formDataProvider.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                            borderSide: BorderSide(
                              color: Colors.grey.shade700,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          label: const Text('Email'),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                        ),
                      ),
                    ),

                    // input message
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your problem';
                          }
                          return null;
                        },
                        controller: formDataProvider.messageController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                            borderSide: BorderSide(
                              color: Colors.grey.shade700,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                          ),
                          label: const Text('Your Problem'),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                        ),
                      ),
                    ),

                    // button submit yang menampilkan alert dialog
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 15.0,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formDataProvider.formKey.currentState!
                              .validate()) {
                            formDataProvider.updateData(
                              formDataProvider.firstNameController.text,
                              formDataProvider.lasstNameController.text,
                              formDataProvider.emailController.text,
                              formDataProvider.messageController.text,
                            );
                            formDataProvider.firstNameController.clear();
                            formDataProvider.lasstNameController.clear();
                            formDataProvider.emailController.clear();
                            formDataProvider.messageController.clear();
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Form Data'),
                                    content: Text(
                                        'First Name   : ${formDataProvider.formData.firstname}\nLast Name   : ${formDataProvider.formData.lastname}\nEmail    : ${formDataProvider.formData.email}\nMessage   : ${formDataProvider.formData.message}'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('CANCEL'),
                                      ),
                                    ],
                                  );
                                });
                          }
                        },
                        child: const Text(
                          'Submit',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
