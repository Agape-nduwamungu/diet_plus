class Meal {
  final String mealTime, name, imagePath, caloriesGained, timeTaken;
  final String preparation;
  final List ingredients;

  Meal({
    this.mealTime,
    this.name,
    this.imagePath,
    this.caloriesGained,
    this.timeTaken,
    this.preparation,
    this.ingredients,
  });
}

final meals = [
  Meal(
      mealTime: "BREAKFAST",
      name: "Avocado-egg toast",
      caloriesGained: "(217 calories)",
      timeTaken: "10-20min",
      imagePath: "assets/itemimg1.jpeg",
      ingredients: [
        "1 slice whole grain bread, toasted (1.5 oz)",
        "1 oz mashed, 1/4 small haas avocado",
        "cooking spray"
            "1 large egg"
            "kosher salt and black pepper to taste"
            "hot sauce, optional"
      ],
      preparation:
          "First mash the avocado in a small bowl and season with salt and pepper.\n Then heat a small nonstick skillet over low heat, spray with oil and gently crack the egg into the skillet. Cover and cook to your liking.\n Finaly, place mashed avocado over toast, top with egg, salt and pepper and hot sauce if desired!"),
  Meal(
      mealTime: "AM SNACK",
      name: "An Orange",
      caloriesGained: "(62 calories)",
      timeTaken: "5-10min",
      imagePath: "assets/itemimg2.png",
      ingredients: [],
      preparation: ""),
  Meal(
      mealTime: "LUNCH",
      name: "Butternut Squash Soup with \n Avocado and Chickpeas",
      caloriesGained: "(402 calories)",
      timeTaken: "20-40min",
      imagePath: "assets/itemimg3.jpeg",
      ingredients: [],
      preparation: ""),
  Meal(
      mealTime: "PM SNACK",
      name: "Kiwi",
      caloriesGained: "(42 calories)",
      timeTaken: "5-10min",
      imagePath: "assets/itemimg4.jpg",
      ingredients: [],
      preparation: ""),
  Meal(
      mealTime: "DINNER",
      name: "Citrus Poached Salmon \nwith Asparagus with \nCauliflower Rice",
      caloriesGained: "(451 calories)",
      timeTaken: "30min-1hr",
      imagePath: "assets/itemimg5.jpg",
      ingredients: [],
      preparation: "")
];
