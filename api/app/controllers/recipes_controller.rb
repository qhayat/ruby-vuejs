class RecipesController < ActionController::API
    # GET /api/recipes
    def index
        @recipes = params.has_key?(:name) ? Recipe.where("name LIKE?", "%#{params['name']}%") : Recipe.all
        render json: @recipes, include: ['ingredients']
    end

    # GET /api/recipes/:id
    def show
        @recipe = Recipe.find(params['id'])
        render json: @recipe, include: ['ingredients']
    end

    # POST /api/recipes
    def create
        @recipe = Recipe.new(recipe_params)

        add_ingredients(@recipe, params['ingredients'])

        if @recipe.save
            render json: @recipe
        else
            render error: {error: 'An error occurred while creating the recipe!'}, status: 400
        end
    end

    # PUT /api/recipes/:id
    def update
        @recipe = Recipe.find(params['id'])

        add_ingredients(@recipe, params['ingredients'])

        if @recipe.update(recipe_params)
            render json: @recipe
        else
            render error: {error: 'An error occurred while updating the recipe!'}, status: 400
        end
    end

    # DELETE /api/recipes/:id
    def destroy
        @recipe = Recipe.find(params['id'])
        if @recipe.destroy
            render json: {message: 'Recipe deleted!'}, status: 200
        else
            render error: {error: 'An error occurred while updating the recipe!'}, status: 400
        end
    end
     
    def recipe_params
        params.require(:recipe).permit(:name, :ingredients)
    end

    def add_ingredients(recipe, ingredients)
        recipe.ingredients.destroy_all
        if ingredients
            ingredients.split(',').each do |ingredientId|
                @ingredient = Ingredient.find(ingredientId)
                if @ingredient
                    recipe.ingredients << @ingredient
                end
            end
        end
    end
end
