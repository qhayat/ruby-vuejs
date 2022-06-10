import axios from "axios";
import { RECIPES_API_URI } from "@/constants/recipes";
import { INGREDIENTS_API_URI } from "@/constants/ingredients";

const { VUE_APP_BACKEND_API_URL } = process.env;

export function getRecipes(filtres = {}) {
  let url = `${VUE_APP_BACKEND_API_URL}/${RECIPES_API_URI}`;

  if (Object.keys(filtres).length > 0) {
    const queryParams = new URLSearchParams(filtres).toString();
    url = `${url}?${queryParams}`;
  }

  return axios.get(url);
}

export function getRecipe(id) {
  return axios.get(`${VUE_APP_BACKEND_API_URL}/${RECIPES_API_URI}/${id}`);
}

export function addRecipe(name, ingredients) {
  let data = {
    name,
  };

  if (ingredients !== "") {
    data = {
      ...data,
      ingredients,
    };
  }

  return axios.post(`${VUE_APP_BACKEND_API_URL}/${RECIPES_API_URI}`, data);
}

export function putRecipe(id, name, ingredients) {
  let data = {
    name,
  };

  if (ingredients !== "") {
    data = {
      ...data,
      ingredients,
    };
  }
  return axios.put(`${VUE_APP_BACKEND_API_URL}/${RECIPES_API_URI}/${id}`, data);
}

export function getIngredients() {
  return axios.get(`${VUE_APP_BACKEND_API_URL}/${INGREDIENTS_API_URI}`);
}
