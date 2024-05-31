import 'package:flutter/material.dart';
import 'package:recipe_app/screens/recipe_list_screen.dart';

Map<String, Map<String, String>> recipeDetails = {
  'Banana Split': {
    'ingredients':
    '\nBananas \n3 Scoops Ice Cream \nWhipped Cream \n2 tbsp chocolate sauce \n3 Pitted Cherries \nColoured Sprinkles',
    'method':
    '\n1. Peel the banana and cut it in half lengthwise, then transfer to a shallow serving bowl.\n '
        '\n2. Add scoops of ice cream, whipped cream and chocolate sauce\n '
        '\n3. Add colourful sprinkles of your choice\n '
        '\n4. Serve and enjoy!',
  },
  'Cheesecake': {
    'ingredients':
    '\n250g digestive biscuits \n100g melted butter \n1 vanilla pod \n600g full fat soft cheese \n100g icing sugar, \n284ml pot of double cream',
    'method': '\n1. To make the base, butter and line a 23cm loose-bottomed tin with baking parchment. '
        'Put the digestive biscuits in a plastic food bag and crush to crumbs using a rolling pin. '
        'Transfer the crumbs to a bowl, then pour over the melted butter. '
        'Mix thoroughly until the crumbs are completely coated. '
        'Tip them into the prepared tin and press firmly down into the base to create an even layer. '
        'Chill in the fridge for 1 hr to set firmly.\n '
        '\n2. Slice the vanilla pod in half lengthways, leaving the tip intact, so that the two halves are still joined. '
        'Holding onto the tip of the pod, scrape out the seeds using the back of a kitchen knife., '
        '\n3. Pour the double cream into a bowl and whisk with an electric mixer until it’s just starting to thicken to soft peaks. '
        'Place the soft cheese, icing sugar and the vanilla seeds in a separate bowl, '
        'then beat for 2 mins with an electric mixer until smooth and starting to thicken, '
        'it will get thin and then start to thicken again. '
        'Tip in the double cream and fold it into the soft cheese mix. '
        'You’re looking for it to be thickened enough to hold its shape when you tip a spoon of it upside down. '
        'If it’s not thick enough, continue to whisk. Spoon onto the biscuit base, '
        'starting from the edges and working inwards, making sure that there are no air bubbles. '
        'Smooth the top of the cheesecake down with the back of a dessert spoon or spatula. '
        'Leave to set in the fridge overnight.\n'
        '\n4.Bring the cheesecake to room temperature about 30 mins before serving. '
        'To remove it from the tin, place the base on top of a can, then gradually pull the sides of the tin down. '
        'Slip the cake onto a serving plate, removing the lining paper and base. '
        'Purée half the strawberries in a blender or food processor with the icing sugar and 1 tsp water, then sieve. '
        'Pile the remaining strawberries onto the cake, and pour the purée over the top.\n'
        '',
  },
  'Dumplings': {
    'ingredients':
    '\n4 cups all-purpose flour(500 g)\n2 teaspoons salt, divided\n1 ¼ cups warm water(300 mL) \n2 cups red cabbage(200 g) \n2 cups green onion(300 g), sliced \n6 cloves garlic, minced \n4 tablespoons ginger, minced \n2 tablespoons soy sauce \n2 tablespoons sesame oil \n½ lb ground pork(225 g) \n½ teaspoon pepper \n¾ cup mushroom(55 g), diced \n¾ cup carrot(90 g), diced \n½ lb shrimp(225 g), peeled and deveined\n',
    'method': '\n1. In a large bowl, combine the flour, 1 teaspoon of salt, and the warm water and mix until well-combined.\n '
        '\n2. Roll out dough on a floured surface and knead until smooth.\n '
        '\n3. Divide the dough into 4 equal parts.\n'
        '\n4. Roll out 1 piece of dough into a thin log and divide into 6 or 8 pieces, depending on the size of dumplings you want. Repeat with the remaining dough portions.\n '
        '\n5. Lightly flour the dough pieces and roll out 1 piece into a thin circle roughly 4-inches (10 cm) in diameter.\n'
        '\n6. Keep the dumpling wrappers separated with a small piece of parchment paper and repeat with the remaining dough.\n'
        '\n7. Combine the cabbage, green onions, garlic, ginger, soy sauce, and sesame oil in a medium bowl and mix until well-incorporated.\n'
        '\n8. For the pork filling, combine the ground pork with the remaining teaspoon of salt, the pepper and 1 cup (125g) of the cabbage mixture and stir until well-incorporated.\n'
        '\n9. For the veggie filling, combine the mushrooms and carrot and microwave for 3 minutes, until soft. Add 1 cup (125g) of the cabbage mixture and stir until well-incorporated.\n'
        '\n10. For the shrimp filling, combine the shrimp with 1 cup (125g) of the cabbage mixture and stir until well incorporated.\n'
        '\n11. To assemble the dumplings, add roughly 1 heaping tablespoon of filling to the center of a dumpling wrapper. With your finger, lightly coat half of the outside of the wrapper with water. Fold the moistened half of the wrapper over the filling and, using your fingers, pleat the edges to seal. Repeat with the remaining fillings and wrappers.\n'
        '\n12. Heat the oil over medium high in a large skillet and add a few dumplings, cooking them in batches. Once the bottoms of the dumplings start to brown, add a splash of water and cover with a lid. Steam for about 5 minutes, or until the dumplings are cooked and the water has evaporated. Transfer the cooked dumplings to a paper towel-lined plate to remove any excess moisture or grease.\n'
        '\n13. In a small bowl, combine the soy sauce, rice vinegar, sesame oil, and pepper flakes and stir to combine. Serve the dumplings immediately with the dipping sauce.\n'
        '\n14. Enjoy! '
  },
  'Egg Fried Bread': {
    'ingredients':
    '\n2 Medium Eggs \n1 tbsp milk \n2 slices of bread \n1 tbsp butter',
    'method': '\n1. Lightly beat the egg in a shallow bowl along with the milk. Season with salt and black pepper.\n '
        '\n2. Dip each slice of bread into the egg mixture, making sure it has soaked up all of the liquid.\n '
        '\n3. Heat a frying pan over a medium heat and add the butter. Swirl the butter around the pan and when its beginning to foam\n '
        '\n4. Add the bread and fry on each side for 1 min or until golden brown.\n'
        '\n5. Transfer to a plate and serve with crispy bacon or fruit compote.\n',
  },
  'Fish': {
    'ingredients':
    '\n3 tablespoons unsalted butter, softened \n1 tablespoon finely minced fresh garlic \n1 tablespoon minced fresh parsley \n2teaspoons minced fresh oregano \n1 teaspoon minced fresh thyme or rosemary \n1/2 teaspoon finely ground pink salt, or to taste \n1/4 teaspoon freshly ground black pepper \n1/2 teaspoon paprika \n4 (6 ounce) cod filets \n2 lemons, each cut into 8 thin slices \n1 tablespoon extra virgin olive oil \n4 sprigs fresh parsley for garnish (optional)',
    'method': '\n1.Preheat the oven to 400 degrees F (200 degrees C).\n '
        '\n2. Place softened butter, minced garlic, parsley, oregano, and thyme or rosemary on a cutting board. Using a sharp knife, cut herbs and garlic into each other and the butter, cutting and mixing as you go. Add pink salt, black pepper, and paprika, and mix until well blended.\n '
        '\n3. Pat cod filets dry. In a 12x18-inch casserole or baking pan, place each filet on top of 2 lemon slices. Evenly divide herb butter mixture among the filets; use a fork or offset spatula to spread herb butter over filets. Top each filet with 2 remaining lemon slices.\n '
        '\n4. Bake in the preheated oven until cod flakes easily with a fork, 13 to 15 minutes. See note.\n'
        '\n5. To serve, drizzle each filet with extra virgin olive oil, and garnish with fresh parsley, if desired.\n',
  },
  'Greek Salad': {
    'ingredients':
    '\n4 large vine tomatoes, cut into irregular wedges \n1 cucumber, peeled, deseeded, then roughly chopped \½ a red onion thinly sliced \n16 Kalamata olives \n1 tsp dried oregano \n85g feta cheese, cut into chunks (barrel matured feta is the best) \n4 tbsp Greek extra virgin olive oil',
    'method':
    '\n1. Place 4 large vine tomatoes, cut into wedges, 1 peeled, deseeded and chopped cucumber, ½ a thinly sliced red onion, 16 Kalamata olives, 1 tsp dried oregano, 85g feta cheese chunks and 4 tbsp Greek extra virgin olive oil in a large bowl.\n '
        '\n2. Lightly season, then serve with crusty bread to mop up all of the juices.\n '
  },
  'Guacamole': {
    'ingredients':
    '\n1 Avocado \n1 Lime \nSalt \n1 Red Onion \n6 Small Tomatos \nMinced Garlic \nPepper \nJalapeno (Optional',
    'method': '\n1. Slice the avocado in half, remove the pit, and scoop into a mixing bowl.\n '
        '\n2. Mash the avocado with a fork and make it as chunky or smooth as you’d like.\n '
        '\n3. Add the remaining ingredients and stir together. Give it a taste test and add a pinch more salt or lime juice if needed.\n '
        '\n4. Serve the guacamole with tortilla chips.',
  },
  'Lasagna': {
    'ingredients':
    '\n1 Ground beef \nOnion \nGarlic cloves \nRed wine (or beef broth) \nMarinara sauce \nDried thyme \nSugar \nParsley \nLasagna noodles \nLasagna Cheese Sauce',
    'method': '\n1. Add oil to a deep pan and sautee onion and beef until browned, 5 minutes then add garlic and stir another minute.\n '
        '\n2. Pour in 1/4 cup of wine and stir until almost evaporated. Add marinara, salt, pepper, thyme, sugar, and parsley; bring to a simmer, then cover and cook 5 minutes.\n '
        '\n3. Preheat your oven to 375ºF and cook the lasagna noodles in a pot of well-salted water until al dente.\n '
        '\n4. Spread 1/2 cup of the meat sauce on the bottom of a 9×13-inch casserole dish. Add 3 noodles, followed by 1/3 of the meat sauce, 1 cup of mozzarella, and half of the cheese sauce. Repeat, then for the top layer, add 3 noodles, 1/3 of the meat sauce, and the remaining mozzarella.\n'
        '\n 5. Cover with foil and bake at 375˚F for 45 minutes, then remove the foil and broil for 3 to 5 minutes, or until the cheese is lightly browned.\n'
        '\n 6. Let the lasagna rest for about 30 minutes before cutting and serving.',
  },
  'Noodles': {
    'ingredients':
    '\n3 tbsp teriyaki sauce \n½ tsp Chinese five-spice powder \n2 tsp medium Madras curry powder \n300g/11oz pork tenderloin, trimmed of any fat \n140g medium egg noodle \n1 tbsp sunflower oil \n2 x 300g packs fresh mixed stir-fry vegetables \n100g cooked prawn, thawed if frozen',
    'method': '\n1. Mix the teriyaki sauce, five-spice and curry powders. Add half to the pork, turning to coat, and leave to marinate for 15 mins.\n '
        '\n2. Heat oven to 200C/180C fan/ gas 6. Remove pork from the marinade and put on a small baking tray lined with foil. Roast for 15-20 mins.\n '
        '\n3. Meanwhile, cook the noodles following pack instructions, but reduce the cooking time by 1 min. Refresh in cold water and drain very well.\n '
        '\n4. Transfer the pork to a chopping board and rest for 5 mins. Set a large non-stick frying pan or wok over a medium-high heat. Add the oil and stir-fry the veg for 3-4 mins. Cut the pork in half lengthways, then thinly slice. Tip into the pan, with the prawns, noodles and remaining marinade. Toss together for 2-3 mins until hot.',
  },
  'Omelette': {
    'ingredients':
    '\n3 eggs, beaten \n1 tsp sunflower oil \n1 tsp butter \nHam \nMushrooms \nGraded Mozzarella Cheese',
    'method': '\n1. Season the beaten eggs well with salt and pepper.\n '
        '\n2. Heat the oil and butter in a non-stick frying pan over a medium-low heat until the butter has melted and is foaming.\n '
        '\n3. Tilt the pan again to allow it to fill back up with the runny egg. Repeat once or twice more until the egg has just set.\n '
        '\n4. Add sliced ham and mushrooms and mozzarella cheese. Feel free to add whatever you like.\n'
        '\n5. Server and enjoy!',
  },
  'Paella': {
    'ingredients':
    '\n1 tbsp olive oil \n1 onion, chopped \n1 tsp each hot smoked paprika and dried thyme \n300g paella or risotto rice \n3 tbsp dry sherry or white wine (optional) \n400g can chopped tomatoes with garlic \n900ml chicken stock \n400g frozen seafood mix, defrosted \n1 lemon, ½ juiced, ½ cut into wedges \nhandful of flat-leaf parsley, roughly chopped',
    'method': '\n1. Heat the olive oil in a large frying pan or wok. Add the onion and soften for 5 mins.\n '
        '\n2. Add the smoked paprika, thyme and paella rice, stir for 1 min, then splash in the sherry, if using. Once evaporated, stir in the chopped tomatoes and chicken stock.\n '
        '\n3. Season and cook, uncovered, for about 15 mins, stirring now and again until the rice is almost tender and still surrounded with some liquid.\n '
        '\n4. Stir in the seafood mix and cover with a lid. Simmer for 5 mins, or until the seafood is cooked through and the rice is tender. Squeeze over the lemon juice, scatter over the parsley and serve with the lemon wedges.\n'
        '\n5. Server and enjoy!',
  },
  'Pancakes': {
    'ingredients':
    '\n2 cups all purpose \n1/4 cup granulated sugar \n4 teaspoons baking powder \n1/4 teaspoon baking soda \n1/2 teaspoon salt \n1 3/4 cups milk \n1/4 cup butter \n2 teaspoons pure vanilla extract \n1 large egg',
    'method': '\n1. Combine together the flour, sugar (or sweetener), baking powder, baking soda and salt in a large-sized bowl. Make a well in the centre and add the milk, slightly cooled melted butter, vanilla and egg.\n '
        '\n2. Use a wire whisk to whisk the wet ingredients together first before slowly folding them into the dry ingredients. Mix together until smooth (there may be a couple of lumps but thats okay).\n '
        '\n3. Set the batter aside and allow to rest while heating up your pan or griddle.\n '
        '\n4. Heat a nonstick pan or griddle over low-medium heat and wipe over with a little butter to lightly grease pan. Pour ¼ cup of batter onto the pan and spread out gently into a round shape with the back of your ladle or measuring cup.\n'
        '\n5. When the underside is golden and bubbles begin to appear on the surface, flip with a spatula and cook until golden. Repeat with remaining batter.\n'
        '\n6. Serve with honey, maple syrup, fruit, ice cream, butter or frozen yoghurt, or enjoy plain!',
  },
  'Apple Pie': {
    'ingredients':
    '\nPie Crust \n6 Cups thinly sliced, peeled apples (6 medium) \n3/4 Cup sugar \n2 Tablespoons all-purpose flour \n3/4 Teaspoon ground cinnamon \n1/4 Teaspoon salt \n1/8 Teaspoon ground nutmeg \n1 tablespoon lemon juice',
    'method': '\n1. Heat oven to 425°F. Place 1 pie crust in ungreased 9-inch glass pie plate. Press firmly against side and bottom.\n '
        '\n2. In large bowl, gently mix filling ingredients; spoon into crust-lined pie plate. Top with second crust. Wrap excess top crust under bottom crust edge, pressing edges together to seal; flute. Cut slits or shapes in several places in top crust.\n '
        '\n3. Bake 40 to 45 minutes or until apples are tender and crust is golden brown. Cover edge of crust with 2- to 3-inch wide strips of foil after first 15 to 20 minutes of baking to prevent excessive browning.\n '
        '\n4. Cool on cooling rack at least 2 hours before serving.',
  },
  'Pizza': {
    'ingredients':
    '\n1 1/2 Cups warm water \n1 Package active dry yeast \n3/4 Cup sugar \n3 3/4 Cups bread flour \n2 Tablespoons extra virgin olive oil \n2 Teaspoons kosher salt \n1 Teaspoon sugar \nPizza Sauce \nToppings of your choice',
    'method': '\n1. Place the warm water in the large bowl of a heavy duty stand mixer. Sprinkle the yeast over the warm water and let it sit for 5 minutes until the yeast is dissolved.\n '
        '\n2. Add the flour, salt, sugar, and olive oil, and using the mixing paddle attachment, mix on low speed for a minute. Then replace the mixing paddle with the dough hook attachment.\n '
        '\n3. Knead the pizza dough on low to medium speed using the dough hook about 7-10 minutes. The dough should be a little sticky, or tacky to the touch. If its too wet, sprinkle in a little more flour.\n '
        '\n4. Spread a thin layer of olive oil over the inside of a large bowl. Place the pizza dough in the bowl and turn it around so that it gets coated with the oil. Let the dough ferment and rise (24 hrs in the fridge, 1 1/2 hours in a warm place). Cover the dough with plastic wrap.\n'
        '\n5. Place a pizza stone on a rack in the lower third of your oven. Preheat the oven to 475°F for at least 30 minutes, preferably an hour. If you dont have a pizza stone, you can use a pizza pan or a thick baking sheet; you need something that will not warp at high temperatures.\n'
        '\n6. Remove the plastic cover from the dough. Dust your hands with flour and push the dough down so it deflates a bit. Divide the dough in half. Form 2 round balls of dough. Place each in its own bowl, cover with plastic and let sit for 15 minutes (or up to 2 hours).\n'
        '\n7. Flatten the dough ball, and stretch out into a round then brush the dough with olive oil\n'
        '\n8. Add pizza sauce and any toppings you like.\n'
        '\n9. Bake pizza in the 475°F oven, until the crust is browned and the cheese is golden, about 10 to 15 minutes.\n'
        '\n10. Server and enjoy!',
  },
  'Pretzel': {
    'ingredients':
    '\n1 ½ Cups warm water \n1 Tablespoon salt \n1 Tablespoon sugar \n1 Packet active dry yeast \n4 ½ Cups flour \n3 Tablespoons oil \n2/3 Cup baking soda \n2 Eggs, beaten \nCoarse salt',
    'method': '\n1. In a bowl, mix water, salt, and sugar until combined. Add yeast, and let rest 5 minutes until yeast starts to foam.\n '
        '\n2. Add flour and 2 tablespoons of oil, and mix thoroughly until a dough forms.\n '
        '\n3. Remove the dough and use the remaining oil to cover the bowl.\n '
        '\n4. Cover bowl with plastic wrap, and leave in a warm place for 1 hour.\n'
        '\n5. Preheat oven to 450°F (230°C).\n'
        '\n6. Cut dough into 8 pieces and roll them out into thin ropes, twisting the two ends to form a pretzel shape.\n'
        '\n7. Add baking soda to a large pot of water, and bring to a rolling boil. Boil each pretzel for 30 seconds per side.\n'
        '\n8. Transfer pretzels to a baking sheet, brush with egg wash, and sprinkle with salt. Bake for 10-15 minutes, until golden brown.\n'
        '\n9. Serve and enjoy!',
  },
  'Caesar Salad': {
    'ingredients':
    '\n2 Chicken breasts \n6 White bread slices\nFeta Cheese \nIceberg \nBlack doritos \nCaesar sauce \n1000 Island sauce \nGarlic powder \nRed pepper powder \nParmesan cheese',
    'method': '\n1. Cut the chicken into bite size pieces and put into a bowl. Season with desired seasoning. Then add the chicken to a pan and cook until fully cooked.\n '
        '\n2. Cut the bread into little bite size squares. Season with garlic and red pepper powder. Then sprinkle parmesan over the bread. Heat in the oven for 10 minutes at 180 degrees, or until the bread is crispy.\n '
        '\n3. Cut the Iceberg into pieces\n '
        '\n4. In a big bowl, add the Iceberg, breadcubes, feta cheese, broken black doritos, the chicken, caesar sauce then sprinkle a little bit of 1000 island sauce\n'
        '\n5. Serve and enjoy!',
  },
  'Sushi': {
    'ingredients':
    '\n2 1 2/3 Cups water \n2/3 Cup uncooked short-grain white rice\n3 Tablespoons rice vinegar \n3 Tablespoons white sugar \n1 1/2 Teaspoons salt \n4 Sheets nori seaweed sheets \n1/2 Pound imitation crabmeat, flaked \n1 Avocado - peeled, pitted, and sliced \n1/2 Cucumber, peeled, cut into small strips \n2 Tablespoons pickled ginger',
    'method': '\n1. Gather all ingredients. Preheat the oven to 300 degrees F (150 degrees C).\n '
        '\n2. Bring water to a boil in a medium pot; stir in rice. Reduce heat to medium-low, cover, and simmer until rice is tender and water has been absorbed, 20 to 25 minutes.\n '
        '\n3. Mix rice vinegar, sugar, and salt in a small bowl. Gently stir into cooked rice in the pot and set aside.\n '
        '\n4. Lay nori sheets on a baking sheet.\n'
        '\n5. Heat nori in the preheated oven until warm, 1 to 2 minutes.\n'
        '\n6. Center 1 nori sheet on a bamboo sushi mat. Use wet hands to spread a thin layer of rice on top. Arrange 1/4 of the crabmeat, avocado, cucumber, and pickled ginger over rice in a line down the center.\n'
        '\n7. Lift one end of the mat and roll it tightly over filling to make a complete roll. Repeat with remaining ingredients.\n'
        '\n8. Use a wet, sharp knife to cut each roll into 4 to 6 slices.',
  },
  'Spaghetti': {
    'ingredients':
    '\n1 Pound ground beef \n1 Medium onion, chopped\n4 Cloves garlic, minced \n1 Small green bell pepper, diced \n1 Can diced tomatoes \n1 Can tomato sauce \n1 Can tomato paste \n2 Teaspoons dried oregano \n2 Teaspoons dried basil \n1 Teaspoon salt \n1/2 Teaspoon ground black pepper',
    'method': '\n1. Gather all ingredients.\n '
        '\n2. Combine ground beef, onion, garlic, and green pepper in a large saucepan over medium-high heat. Cook and stir until meat is browned and crumbly and vegetables are tender, 5 to 7 minutes. Drain grease.\n '
        '\n3. Stir diced tomatoes, tomato sauce, and tomato paste into the pan. Season with oregano, basil, salt, and pepper. Simmer spaghetti sauce for 1 hour, stirring occasionally.\n '
        '\n4. Serve hot and enjoy!\n',
  },
  'Vegan Sushi': {
    'ingredients':
    '\nShort-grain Japanese rice \nRice vinegar\nSugar \nSalt \nNori sheets \nCarrots \nCucumber \nAvocado \nFirm tofu \nSoy sauce \nSesame seeds',
    'method': '\n1. Rinse the sushi rice in a fine mesh colander under cold water.\n '
        '\n2. Either cook the rice in your Instant Pot or cook it on the stove top. If you are using an Instant Pot use the rice setting (low pressure for 12 minutes). Allow the pressure to release naturally. The rice should be tender and the water should be completely absorbed. If you are cooking it on the stove top, bring the rice with the water to a boil, then reduce the heat to low, cover, and cook for 20 minutes. I usually prefer to make sushi rice in my Instant Pot.\n '
        '\n3. Combine the rice vinegar, the sugar, and the salt in a small bowl. Add the cooked rice to a large bowl and stir in the vinegar sugar mixture until well combined. Let it cool down. Cover the bowl of rice with a damp napkin or kitchen cloth until it’s ready to use.\n '
        '\n4. In the meanwhile, cut the cucumber, the carrots, the avocado, and the tofu in thin strips. Heat some oil in a flat pan and cook the tofu strips for about 4 minutes on high heat until crispy. Add a tablespoon of soy sauce while cooking.\n'
        '\n5. Place a nori sheet lengthwise on a bamboo rolling mat with the shiny side down. Fill a shallow bowl with cool water and wet your hands. Take a handful of rice and place it in the center of the nori sheet. Spread evenly, leaving a 3/4 – inch strip of the nori sheet uncovered on the top.\n'
        '\n6. Place some thin strips of cucumber, carrot, tofu and avocado in a line on the near edge of the nori sheet. Make sure not to overfill the nori.\n'
        '\n7. Tuck your thumbs underneath the bamboo mat and hold the ingredients with your fingers. Then roll the bamboo mat and the nori sheet towards your fingers with slight pressure. Make sure that the ingredients are fully covered with the rice and the nori sheet. Roll slowly to ensure that the sushi is rolled evenly.\n'
        '\n8. Wet your fingers again in the shallow bowl of cool water and moisturize the uncovered strip of the nori sheet. Then completely roll up the nori sheet with the bamboo mat.\n'
        '\n9. Place the sushi roll on a cutting board and carefully cut it in half with a sharp knife. Put the knife under cold water before and after cutting. Put the sushi halves beside each other and carefully cut them into small slices.',
  },
  'Taco': {
    'ingredients':
    '\nTomato sauce \nOil \nMinced garlic \nSmoked paprika powder \n1 Lime \nBaking soda \nSalt \nSugar \nSour cream \nCilantro \nOregano \nCayenne powder \nCoriander powder \nChili powder \nTaco shells \nGround beef \nTomatoes \nShredded lettuce \nshredded cheese',
    'method': '\n1. In a medium bowl, mash the beef with the baking soda and salt. Let sit for at least 15 minutes or up to 1 hour.\n '
        '\n2. Heat the oil in a large nonstick skillet over medium heat until hot and shimmering. Add the onion and cook, stirring occasionally, until softened, about 4 minutes.\n '
        '\n3. Add the garlic and cook 1 minute more. Do not brown. Then add the beef and spices\n '
        '\n4. Cook, stirring constantly and breaking meat up with a wooden spoon, until the beef is no longer pink, about 5 minutes. Add the tomato sauce, water, sugar, and lime juice.\n'
        '\n5. Bring to a simmer. Reduce the heat to medium-low and cook, uncovered, stirring frequently and breaking up the meat so that no chunks remain, until the liquid has reduced and thickened (the mixture should not be completely dry), 10 to 15 minutes. Taste and adjust seasonings if necessary.\n'
        '\n6. Using a wide, shallow spoon, divide the filling evenly among taco shells; place two or three tacos on individual plates. Serve immediately, passing the toppings separately.\n'
        '\n7. Enjoy!.\n',
  },
};

List<String> recipeImages = [
  'assets/images/bananasplit.png',
  'assets/images/cheesecake.png',
  'assets/images/dumplings.png',
  'assets/images/eggfriedbread.png',
  'assets/images/fish.png',
  'assets/images/greeksalad.png',
  'assets/images/guacamole.png',
  'assets/images/lasagna.png',
  'assets/images/noodles.png',
  'assets/images/omelette.png',
  'assets/images/paella.png',
  'assets/images/pancakes.png',
  'assets/images/pie.png',
  'assets/images/pizza.png',
  'assets/images/pretzel.png',
  'assets/images/sesarsalad.png',
  'assets/images/smileysushi.png',
  'assets/images/spagetti.png',
  'assets/images/sushi.png',
  'assets/images/taco.png',
];

List<String> recipeNames = [
  'Banana Split',
  'Cheesecake',
  'Dumplings',
  'Egg Fried Bread',
  'Fish',
  'Greek Salad',
  'Guacamole',
  'Lasagna',
  'Noodles',
  'Omelette',
  'Paella',
  'Pancakes',
  'Apple Pie',
  'Pizza',
  'Pretzel',
  'Caesar Salad',
  'Sushi',
  'Spaghetti',
  'Vegan Sushi',
  'Taco',
];