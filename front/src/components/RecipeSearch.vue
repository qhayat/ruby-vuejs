<template>
  <div id="recipe-search">
    <input type="text" placeholder="Search a recipe by name" v-model="q" />
    <button class="app-button" v-on:click="search()">Search</button>
  </div>
</template>

<script>
export default {
  name: "recipe-search-component",
  data() {
    return {
      q: "",
    };
  },
  props: {
    getRecipes: Function,
  },
  methods: {
    search() {
      if (this.q !== "") {
        this.getRecipes({ name: this.q });
      }
    },
  },
};
</script>
