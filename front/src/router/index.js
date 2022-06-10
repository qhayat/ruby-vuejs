import { createRouter, createWebHashHistory } from "vue-router";
import HomeVue from "../pages/Home.vue";
import NewRecipe from "../pages/NewRecipe.vue";
import EditRecipe from "../pages/EditRecipe.vue";
import "../assets/styles.css";

const routes = [
  {
    path: "/",
    name: "all-recipes",
    component: HomeVue,
  },
  {
    path: "/recipes/add",
    name: "new-recipe",
    component: NewRecipe,
  },
  {
    path: "/recipes/:id/edit",
    name: "edit-recipe",
    component: EditRecipe,
  },
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

export default router;
