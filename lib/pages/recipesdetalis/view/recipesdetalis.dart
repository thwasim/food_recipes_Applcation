import 'package:flutter/material.dart';
import 'package:food_recipes/pages/recipesdetalis/view/cardinside.dart';

class RecipesDetailsScreen extends StatelessWidget {
  const RecipesDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      primary: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                color: Colors.transparent,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 20, 163, 134),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.42,
                      child: Image.network(
                        'https://www.vegrecipesofindia.com/wp-content/uploads/2020/04/south-indian-food.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 28,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  )),
              Positioned(
                  bottom: 7,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.14,
                    width: MediaQuery.of(context).size.height * 0.38,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 150, 244, 226),
                        borderRadius: BorderRadius.circular(30)),
                    child: const CardInside(),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 280),
                  child: Divider(
                    thickness: 3,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const Flexible(
                          child: Text(
                            "requirement",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("How To make",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              ),
              Padding(
                padding: EdgeInsets.only(right: 113, left: 130),
                child: Divider(
                  thickness: 3,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    '''The Historical Dictionary of Indian Food by Late Food Historian KT Achaya describes Sambar as, a fairly thick spicy extract of thuvar dhal soured with tamarind, frequently containing soft vegetables like brinjal, drumstick, gourd and lady's finger. Sambar can be consumed along with idli, dosa or rice Benefits Of Sambar: 6 More Reasons To Love The South Indian SensationYou know nothing would disappoint you more to see a plate of puffy hot idlis or piping hot dosa without its must-have accompaniment-sambhar. Sambhar is a south Indian vegetarian stew, made of pulses and vegetables.தமிழில் படிக்கSushmita SenguptaUpdated: April 12, 2021 09:48 ISTRead Time:4 min1Benefits Of Sambar: 6 More Reasons To Love The South Indian SensationHighlightsSambhar is a south Indian vegetarian stew made of pulsesA bowlful of this savoury stew packs a number of health benefitsSambhar is much more than an assortment of delicious flavoursYou know nothing would disappoint you more to see a plate of puffy hot idlis or piping hot dosa without its must-have accompaniment - sambar. Sambar is a south Indian vegetarian stew, made of pulses and vegetables. 'The Historical Dictionary of Indian Food' by Late Food Historian KT Achaya describes Sambar as, "a fairly thick spicy extract 
                  of thuvar dhal soured with tamarind, frequently containing soft vegetables like brinjal, drumstick, gourd and lady's finger." Sambar can be consumed along with idli, dosa or rice. It is the most common dish and provides various health promoting benefits. It is a complete dish and you do not need to make separate vegetable dishes. Sour, spicy and 
                  soothing, the refreshing flavours of sambar are a nationwide phenomenon. But, did you know that the lip-smacking South Indian preparation is much more than an assortment of delicious flavours. A bowlful of this savoury stew packs a number of health benefits, every sambar lover must know!Here are some benefits of eating sambar:1. High On Proteins
                   Sambar is made of pulses. Dal is a good source of vegetarian protein. Vegetarians and vegans, often find themselves in a dearth of options when it comes to proteins. With eggs, fish and meat out of the league, sambar can prove to be an effective and delicious source of protein. Proteins are the building blocks of body; they are required for muscle growth and repair, and weight loss too.
                  '''),
              )
            ],
          )
        ],
      ),
    )));
  }
}
