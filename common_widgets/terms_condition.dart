import 'package:flutter/material.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Condition"),
        leadingWidth: 40,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset('assets/icons/back_round.png')),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "More than just a hair salon, we provide classic barbershop service with legendary style.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et mauris enim, viverra convallis blandit facilisi eget id urna. Consequat cursus donec in diam pellentesque imperdiet elit. Et sagittis, morbi non adipiscing malesuada nibh diam quam. Arcu, et convallis arcu in mi. Proin dui non, risus tincidunt. Nunc id sollicitudin diam aliquet volutpat nam rhoncus morbi. Non sit ac pulvinar commodo tincidunt magnis nascetur. Scelerisque eget accumsan eget nisl vestibulum, tristique praesent tempus eget. Vestibulum viverra ut dapibus aliquam nunc auctor. Orci ultrices pellentesque sed ultricies ipsum quis neque, elementum. Enim donec sed pellentesque aliquet mi ultricies turpis non maecenas. Purus aliquet iaculis amet, vel eleifend ut elit. Vulputate amet, metus purus aenean sapien tempor, neque turpis risus. Egestas id urna ultrices dignissim.",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20),
              Text(
                "More than just a hair salon, we provide classic barbershop service with legendary style.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et mauris enim, viverra convallis blandit facilisi eget id urna. Consequat cursus donec in diam pellentesque imperdiet elit. Et sagittis, morbi non adipiscing malesuada nibh diam quam. Arcu, et convallis arcu in mi. Proin dui non, risus tincidunt. Nunc id sollicitudin diam aliquet volutpat nam rhoncus morbi. Non sit ac pulvinar commodo tincidunt magnis nascetur. Scelerisque eget accumsan eget nisl vestibulum, tristique praesent tempus eget. Vestibulum viverra ut dapibus aliquam nunc auctor. Orci ultrices pellentesque sed ultricies ipsum quis neque, elementum. Enim donec sed pellentesque aliquet mi ultricies turpis non maecenas. Purus aliquet iaculis amet, vel eleifend ut elit. Vulputate amet, metus purus aenean sapien tempor, neque turpis risus. Egestas id urna ultrices dignissim.",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ),
    );
  }
}
