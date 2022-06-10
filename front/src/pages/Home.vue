<template>
  <RecipeSearchVue v-bind:get-recipes="getRecipes" />
  <LoaderVue v-if="loading" />
  <RecipesVue v-bind:recipes="recipes" v-if="!loading" />
</template>

<script>
import { getRecipes } from "@/providers/ApiProvider";
import RecipesVue from "@/components/Recipes.vue";
import LoaderVue from "@/components/Loader.vue";
import RecipeSearchVue from "@/components/RecipeSearch.vue";

export default {
  name: "Home-page",
  components: {
    RecipesVue,
    RecipeSearchVue,
    LoaderVue,
  },
  data() {
    return {
      recipes: [],
      loading: true,
    };
  },
  methods: {
    getRecipes(filtres = {}) {
      return getRecipes(filtres).then((response) => {
        this.recipes = response.data;
        this.loading = false;
      });
    },
  },
  mounted() {
    this.getRecipes();
  },
};
</script>
