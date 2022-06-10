<template>
  <div id="edit-recipe" class="recipe-form-container">
    <RecipeFormVue
      v-if="!loading && !fetchingError"
      v-bind:form-submit="formSubmit"
      v-bind:set-success="setSuccess"
      v-bind:set-errors="setErrors"
      v-bind:recipe="recipe"
    />
    <Loader v-if="loading" />
    <div class="app-error" v-if="errors.length > 0">
      <ul>
        <li v-for="(error, index) in errors" :key="index">{{ error }}</li>
      </ul>
    </div>
    <div class="app-success" v-if="errors.length === 0 && success !== ''">
      {{ success }}
    </div>
  </div>
</template>

<script>
import RecipeFormVue from "@/components/RecipeForm.vue";
import { getRecipe, putRecipe } from "@/providers/ApiProvider";
import { useRoute } from "vue-router";
import Loader from "@/components/Loader.vue";

export default {
  name: "edit-recipe",
  components: {
    RecipeFormVue,
    Loader,
  },
  data() {
    return {
      errors: [],
      success: "",
      recipe: null,
      fetchingError: false,
      loading: true,
    };
  },
  methods: {
    formSubmit(formData) {
      putRecipe(formData.id, formData.name, formData.ingredients)
        .then(() => {
          this.success = "Recipe updated !";
        })
        .catch(() => this.errors.push("An error occured !"));
    },
    setErrors(errors) {
      this.errors = errors;
    },
    setSuccess(success) {
      this.success = success;
    },
  },
  mounted() {
    const route = useRoute();
    const id = route.params.id;
    getRecipe(id)
      .then((res) => (this.recipe = res.data))
      .catch(() => (this.fetchingError = true))
      .finally(() => (this.loading = false));
  },
};
</script>
