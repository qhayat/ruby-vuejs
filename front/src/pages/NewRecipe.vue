<template>
  <div id="new-recipe" class="recipe-form-container">
    <RecipeFormVue
      v-bind:form-submit="formSubmit"
      v-bind:set-success="setSuccess"
      v-bind:set-errors="setErrors"
    />
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
import { addRecipe } from "@/providers/ApiProvider";

export default {
  name: "new-recipe",
  components: {
    RecipeFormVue,
  },
  data() {
    return {
      errors: [],
      success: "",
    };
  },
  methods: {
    formSubmit(formData) {
      addRecipe(formData.name, formData.ingredients)
        .then(() => {
          this.success = "Recipe added !";
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
};
</script>
