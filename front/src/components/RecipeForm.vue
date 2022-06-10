<template>
  <form v-on:submit="submit()">
    <div class="form-group">
      <label>Name of recipe</label><br />
      <input type="text" v-model="formData.name" />
    </div>
    <div class="form-group">
      <label>Ingredients</label><br />
      <span
        class="ingredient"
        v-for="(ingredient, index) in formData.ingredients"
        :key="index"
      >
        {{
          ingredientsFromApi.find(
            (ingredientFromApi) => ingredientFromApi.id == ingredient.id
          ).name
        }}
      </span>
      <select v-model="formData.ingredients" multiple>
        <option
          v-for="(ingredient, index) in ingredientsFromApi"
          :key="index"
          :value="ingredient.id"
        >
          {{ ingredient.name }}
        </option>
      </select>
    </div>
    <button class="app-button" type="submit">
      <span v-if="!this.formData.id">Add the recipe</span>
      <span v-if="this.formData.id">Edit the recipe</span>
    </button>
  </form>
</template>

<script>
import { getIngredients } from "@/providers/ApiProvider";
import recipeValidator from "@/validators/recipeValidator";

export default {
  name: "recipe-form",
  props: {
    formSubmit: Function,
    setSuccess: Function,
    setErrors: Function,
    recipe: Object,
  },
  data() {
    return {
      ingredientsFromApi: [],
      formData: {
        name: "",
        ingredients: [],
      },
    };
  },
  mounted() {
    getIngredients().then((res) => (this.ingredientsFromApi = res.data));

    if (this.recipe) {
      this.formData.name = this.recipe.name;
      this.formData.ingredients = this.recipe.ingredients;
      this.formData.id = this.recipe.id;
    }
  },
  methods: {
    submit() {
      this.setErrors([]);

      const errors = [];
      recipeValidator(this.formData, errors);
      this.setErrors(errors);

      if (errors.length === 0) {
        this.formSubmit(this.formData);
      }
    },
  },
};
</script>
