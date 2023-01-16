class Recipe {
  const Recipe({
    this.id = '',
    this.name = '',
    this.alternateName,
    this.tags,
    this.video,
    this.category = '',
    this.iba,
    this.alcoholic = true,
    this.glass,
    this.instructions = '',
    this.instructionsEs,
    this.instructionsDe,
    this.instructionsFr,
    this.instructionsIt,
    this.instructionsZhHans,
    this.instructionsZhHant,
    this.image = '',
    this.ingredient1,
    this.ingredient2,
    this.ingredient3,
    this.ingredient4,
    this.ingredient5,
    this.ingredient6,
    this.ingredient7,
    this.ingredient8,
    this.ingredient9,
    this.ingredient10,
    this.ingredient11,
    this.ingredient12,
    this.ingredient13,
    this.ingredient14,
    this.ingredient15,
    this.imageSource,
    this.imageAttribution,
  });

  final String id;
  final String name;
  final String? alternateName;
  final String? tags;
  final String? video;
  final String category;
  final String? iba;
  final bool alcoholic;
  final String? glass;
  final String instructions;
  final String? instructionsEs;
  final String? instructionsDe;
  final String? instructionsFr;
  final String? instructionsIt;
  final String? instructionsZhHans;
  final String? instructionsZhHant;
  final String image;
  final Ingredient? ingredient1;
  final Ingredient? ingredient2;
  final Ingredient? ingredient3;
  final Ingredient? ingredient4;
  final Ingredient? ingredient5;
  final Ingredient? ingredient6;
  final Ingredient? ingredient7;
  final Ingredient? ingredient8;
  final Ingredient? ingredient9;
  final Ingredient? ingredient10;
  final Ingredient? ingredient11;
  final Ingredient? ingredient12;
  final Ingredient? ingredient13;
  final Ingredient? ingredient14;
  final Ingredient? ingredient15;

  final String? imageSource;
  final String? imageAttribution;

  List<Ingredient?> get ingredients => [
        ingredient1,
        ingredient2,
        ingredient3,
        ingredient4,
        ingredient5,
        ingredient6,
        ingredient7,
        ingredient8,
        ingredient9,
        ingredient10,
        ingredient11,
        ingredient12,
        ingredient13,
        ingredient14,
        ingredient15,
      ].where((element) => element != null).toList();

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json["idDrink"],
      name: json["strDrink"],
      alternateName: json["strDrinkAlternate"],
      tags: json["strTags"],
      video: json["strVideo"],
      category: json["strCategory"],
      iba: json["iBA"],
      alcoholic: json["strAlcoholic"].toString().toLowerCase() == "alcoholic",
      glass: json["strGlass"],
      instructions: json["strInstructions"],
      instructionsEs: json["strInstructionsES"],
      instructionsDe: json["strInstructionsDE"],
      instructionsFr: json["strInstructionsFR"],
      instructionsIt: json["strInstructionsIT"],
      instructionsZhHans: json["strInstructionsZH-HANS"],
      instructionsZhHant: json["strInstructionsZH-HANT"],
      image: json["strDrinkThumb"],
      ingredient1: json["strIngredient1"] != null && json["strMeasure1"] != null
          ? Ingredient(
              name: json["strIngredient1"], measure: json["strMeasure1"])
          : null,
      ingredient2: json["strIngredient2"] != null && json["strMeasure2"] != null
          ? Ingredient(
              name: json["strIngredient2"], measure: json["strMeasure2"])
          : null,
      ingredient3: json["strIngredient3"] != null && json["strMeasure3"] != null
          ? Ingredient(
              name: json["strIngredient3"], measure: json["strMeasure3"])
          : null,
      ingredient4: json["strIngredient4"] != null && json["strMeasure4"] != null
          ? Ingredient(
              name: json["strIngredient4"], measure: json["strMeasure4"])
          : null,
      ingredient5: json["strIngredient5"] != null && json["strMeasure5"] != null
          ? Ingredient(
              name: json["strIngredient5"], measure: json["strMeasure5"])
          : null,
      ingredient6: json["strIngredient6"] != null && json["strMeasure6"] != null
          ? Ingredient(
              name: json["strIngredient6"], measure: json["strMeasure6"])
          : null,
      ingredient7: json["strIngredient7"] != null && json["strMeasure7"] != null
          ? Ingredient(
              name: json["strIngredient7"], measure: json["strMeasure7"])
          : null,
      ingredient8: json["strIngredient8"] != null && json["strMeasure8"] != null
          ? Ingredient(
              name: json["strIngredient8"], measure: json["strMeasure8"])
          : null,
      ingredient9: json["strIngredient9"] != null && json["strMeasure9"] != null
          ? Ingredient(
              name: json["strIngredient9"], measure: json["strMeasure9"])
          : null,
      ingredient10:
          json["strIngredient10"] != null && json["strMeasure10"] != null
              ? Ingredient(
                  name: json["strIngredient10"], measure: json["strMeasure10"])
              : null,
      ingredient11:
          json["strIngredient11"] != null && json["strMeasure11"] != null
              ? Ingredient(
                  name: json["strIngredient11"], measure: json["strMeasure11"])
              : null,
      ingredient12:
          json["strIngredient12"] != null && json["strMeasure12"] != null
              ? Ingredient(
                  name: json["strIngredient12"], measure: json["strMeasure12"])
              : null,
      ingredient13:
          json["strIngredient13"] != null && json["strMeasure13"] != null
              ? Ingredient(
                  name: json["strIngredient13"], measure: json["strMeasure13"])
              : null,
      ingredient14:
          json["strIngredient14"] != null && json["strMeasure14"] != null
              ? Ingredient(
                  name: json["strIngredient14"], measure: json["strMeasure14"])
              : null,
      ingredient15:
          json["strIngredient15"] != null && json["strMeasure15"] != null
              ? Ingredient(
                  name: json["strIngredient15"], measure: json["strMeasure15"])
              : null,
      imageSource: json["imageSource"],
      imageAttribution: json["imageAttribution"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alternateName": alternateName,
        "tags": tags,
        "video": video,
        "strCategory": category,
        "iBA": iba,
        "alcoholic": alcoholic,
        "glass": glass,
        "instructions": instructions,
        "instructionsES": instructionsEs,
        "instructionsDE": instructionsDe,
        "instructionsFR": instructionsFr,
        "instructionsIT": instructionsIt,
        "instructionsZH-HANS": instructionsZhHans,
        "instructionsZH-HANT": instructionsZhHant,
        "image": image,
        "ingredient1": ingredient1,
        "ingredient2": ingredient2,
        "ingredient3": ingredient3,
        "ingredient4": ingredient4,
        "ingredient5": ingredient5,
        "ingredient6": ingredient6,
        "ingredient7": ingredient7,
        "ingredient8": ingredient8,
        "ingredient9": ingredient9,
        "ingredient10": ingredient10,
        "ingredient11": ingredient11,
        "ingredient12": ingredient12,
        "ingredient13": ingredient13,
        "ingredient14": ingredient14,
        "ingredient15": ingredient15,
        "imageSource": imageSource,
        "imageAttribution": imageAttribution,
      };

  @override
  String toString() => '''
      {
        id: $id,
        name: $name,
        alternateName: $alternateName,
        tags: $tags,
        video: $video,
        category: $category,
        iba: $iba,
        alcoholic: $alcoholic,
        glass: $glass,
        instructions: $instructions,
        instructionsEs: $instructionsEs,
        instructionsDe: $instructionsDe,
        instructionsFr: $instructionsFr,
        instructionsIt: $instructionsIt,
        instructionsZhHans: $instructionsZhHans,
        instructionsZhHant: $instructionsZhHant,
        image: $image,
        ingredient1: $ingredient1,
        ingredient2: $ingredient2,
        ingredient3: $ingredient3,
        ingredient4: $ingredient4,
        ingredient5: $ingredient5,
        ingredient6: $ingredient6,
        ingredient7: $ingredient7,
        ingredient8: $ingredient8,
        ingredient9: $ingredient9,
        ingredient10: $ingredient10,
        ingredient11: $ingredient11,
        ingredient12: $ingredient12,
        ingredient13: $ingredient13,
        ingredient14: $ingredient14,
        ingredient15: $ingredient15,
        imageSource: $imageSource,
        imageAttribution: $imageAttribution
      }''';
}

class Ingredient {
  const Ingredient({
    this.name = '',
    this.measure = '',
  });
  final String name;
  final String measure;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        measure: json["measure"],
      );

  @override
  String toString() => '''
      {
        name: $name,
        measure: $measure
      }''';
}
