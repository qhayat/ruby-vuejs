class IngredientsController < ActionController::API
    # GET /api/ingredients
    def index
        @ingredients = Ingredient.all
        render json: @ingredients
    end

    # GET /api/ingredients/:id
    def show
        @ingredient = Ingredient.find(params['id'])
        render json: @ingredient
    end

    # POST /api/ingredients
    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            render json: @ingredient
        else
            render error: {error: 'An error occurred while creating the ingredient!'}, status: 400
        end
    end

    # PUT /api/ingredients/:id
    def update
        @ingredient = Ingredient.find(params['id'])

        if @ingredient.update(ingredient_params)
            render json: @ingredient
        else
            render error: {error: 'An error occurred while updating the ingredient!'}, status: 400
        end
    end

    # DELETE /api/ingredients/:id
    def destroy
        @ingredient = Ingredient.find(params['id'])
        if @ingredient.destroy
            render json: {message: 'Ingredient deleted!'}, status: 200
        else
            render error: {error: 'An error occurred while updating the ingredient!'}, status: 400
        end
    end
    
    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
end
