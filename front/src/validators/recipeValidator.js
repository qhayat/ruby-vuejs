import { RECIPE_NAME_REGEX } from "@/constants/recipes";

export default function (formData, errors = []) {
  if (formData.name === "") {
    errors.push("Enter a name for recipe");
  } else if (!formData.name.match(RECIPE_NAME_REGEX)) {
    errors.push("Enter a valid name for recipe");
  }

  return errors;
}
