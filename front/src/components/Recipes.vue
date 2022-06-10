<template>
  <div id="recipes">
    <h1>Recipes available</h1>
    <table>
      <thead>
        <tr>
          <th>Name of recipe</th>
          <th>Ingredients</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(recipe, index) in recipes" :key="index">
          <td>{{ recipe.name }}</td>
          <td>
            <span
              v-for="(ingredient, index) in recipe.ingredients"
              :key="index"
              class="ingredient"
            >
              {{ ingredient.name }}
            </span>
          </td>
          <td>
            <button
              class="app-button"
              v-on:click="goTo('edit-recipe', { id: recipe.id })"
            >
              Edit
            </button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import router from "@/router";

export default {
  name: "recipes-component",
  props: {
    recipes: Array,
  },
  methods: {
    goTo(name, params = {}) {
      router.push({ name, params });
    },
  },
};
</script>
